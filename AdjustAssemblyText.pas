{******************************************************************************}
{ Adjust Assembly Text Script, based on the follows script                     }  
{ - Created By Derryn Harvie, Embedded Reasoning                               }
{ AdjustDesignators script - written by Mattias Ericson, Omnisys Instruments AB}
{                                                                              }
{ Written for Altium                                                           }
{                                                                              }
{ This script will rotate assembly designator text and center it               }
{                                                                              }
{ Change log:                                                                  }
{ Ver 1.0 - Initial release                                                    }
{                                                                              }
{******************************************************************************}

//Enter settings here
const
     BoundingLayers = True; // Look for bounding rectangle in selected layers
     Layer1 = eTopOverlay;  // Change this to the layer/layers that best represent the component
     Layer2 = eBottomOverlay; // In many cases eTopOverlay OR eBottomOverLay will be used
     LayerAssmTop = eMechanical6;  // Top assembly layer
     LayerAssmBot = eMechanical7;  // Bottom assembly layer

{..............................................................................}
Procedure AdjustAssemblyText;
Var
    Track                   : IPCB_Primitive;
    TrackIteratorHandle     : IPCB_GroupIterator;
    TrackCount              : Integer;
    Text                   : IPCB_Primitive;
    TextIteratorHandle     : IPCB_GroupIterator;
    Component               : IPCB_Component;
    ComponentIteratorHandle : IPCB_BoardIterator;
    S                       : TPCBString;
    MaxX                    : Integer;
    MinX                    : Integer;
    MaxY                    : Integer;
    MinY                    : Integer;
    X                       : Integer;
    Y                       : Integer;
    CenX                       : Integer;
    CenY                       : Integer;
    Size                    : Integer;
    Designator              : IPCB_Text;
    PCBSystemOptions        : IPCB_SystemOptions;
    DRCSetting              : boolean;
    R                       : TCoordRect;
begin
     // Verify that the document is a PcbDoc
     if PCBServer.GetCurrentPCBBoard = Nil Then Exit;

     // Disables Online DRC during designator movement to improve speed
     PCBSystemOptions := PCBServer.SystemOptions;

     If PCBSystemOptions = Nil Then Exit;

     DRCSetting := PCBSystemOptions.DoOnlineDRC;
     PCBSystemOptions.DoOnlineDRC := false;

     try
        // Notify the pcbserver that we will make changes
        PCBServer.PreProcess;
        ComponentIteratorHandle := PCBServer.GetCurrentPCBBoard.BoardIterator_Create;
        ComponentIteratorHandle.AddFilter_ObjectSet(MkSet(eComponentObject));
        ComponentIteratorHandle.AddFilter_IPCB_LayerSet(LayerSet.AllLayers);
        ComponentIteratorHandle.AddFilter_Method(eProcessAll);

        S := '';

        Component := ComponentIteratorHandle.FirstPCBObject;
        while (Component <> Nil) Do
        begin

             MaxX:= 0;
             MinX:= 999999999;

             MaxY:= 0;
             MinY:= 999999999;

             TrackIteratorHandle := Component.GroupIterator_Create;
             TrackIteratorHandle.AddFilter_ObjectSet(MkSet(eTrackObject));

             Track := TrackIteratorHandle.FirstPCBObject;
             while (Track <> Nil) Do
             begin
                  // Look for component's tracks on the layers choosen under settings only when BoundingLayers is true
                  Inc(TrackCount);

                  If (((Track.Layer = Layer1) OR
                  (Track.Layer = Layer2) OR
                  (Track.Layer = LayerAssmTop) OR
                  (Track.Layer = LayerAssmBot)) AND (BoundingLayers = True))Then
                  begin
                       if Track.X1>= MaxX then MaxX:=Track.X1;
                       if Track.X1<= MinX then MinX:=Track.X1;

                       if Track.X2>= MaxX then MaxX:=Track.X2;
                       if Track.X2<= MinX then MinX:=Track.X2;

                       if Track.Y1>= MaxY then MaxY:=Track.Y1;
                       if Track.Y1<= MinY then MinY:=Track.Y1;

                       if Track.Y2>= MaxY then MaxY:=Track.Y2;
                       if Track.Y2<= MinY then MinY:=Track.Y2;
                  end;

                  Track := TrackIteratorHandle.NextPCBObject;
             end;

           //Calculate the width and hegith of the bounding rectangle
            if TrackCount > 0 then
            begin
                 Y:=MaxY-MinY;
                 X:=MaxX-MinX;
            end
            else
            begin
                 R := Component.BoundingRectangleNoNameComment;
                 if R.left < MinX then MinX := R.left;
                 if R.bottom < MinY then MinY := R.bottom;
                 if R.right > MaxX then MaxX := R.right;
                 if R.top > MaxY then MaxY := R.top;

                 Y:=MaxY-MinY;
                 X:=MaxX-MinX;
            end;

            CenX := MinX + (X/2);
            CenY := Miny + (Y/2);


            // Find a text object on layer
            TextIteratorHandle := Component.GroupIterator_Create;
            TextIteratorHandle.AddFilter_ObjectSet(MkSet(eTextObject));
            TextIteratorHandle.AddFilter_LayerSet(MkSet(LayerAssmTop));
            // Only worrying about the first text object
            Text := TextIteratorHandle.FirstPCBObject;
            Component.GroupIterator_Destroy(TextIteratorHandle);

            if (Text <> Nil) then
            begin

                          // notify that the pcb object is going to be modified
                        PCBServer.SendMessageToRobots(Text.I_ObjectAddress, c_Broadcast, PCBM_BeginModify, c_NoEventData);
                        // Rotate the designator to increase the readabillity
                        if Y > X then
                        begin
                             Text.Rotation := 90;
                        end
                        else
                        begin
                            Text.Rotation := 0;
                        end;

                        if(Text.Layer = LayerAssmTop) then
                        begin
                                if Text.Rotation = 0 then
                                begin
                                      Text.XLocation := CenX + ((Text.X1Location - Text.X2Location)/2);
                                      Text.YLocation := CenY + ((Text.Y1Location - Text.Y2Location)/2);
                                end
                                else
                                begin
                                      Text.YLocation := CenY + ((Text.X1Location - Text.X2Location)/2);
                                      Text.XLocation := CenX - ((Text.Y1Location - Text.Y2Location)/2);
                                end;
                        end;
                        if(Text.Layer = LayerAssmBot) then
                        begin
                                if Text.Rotation = 0 then
                                begin
                                      Text.XLocation := CenX - ((Text.X1Location - Text.X2Location)/2);
                                      Text.YLocation := CenY + ((Text.Y1Location - Text.Y2Location)/2);
                                end
                                else
                                begin
                                      Text.YLocation := CenY - ((Text.X1Location - Text.X2Location)/2);
                                      Text.XLocation := CenX - ((Text.Y1Location - Text.Y2Location)/2);
                                end;
                        end;
                       // notify that the pcb object is modified
                        PCBServer.SendMessageToRobots(Text.I_ObjectAddress, c_Broadcast, PCBM_EndModify , c_NoEventData);
           end;

           // Destroy the track interator
            Component.GroupIterator_Destroy(TrackIteratorHandle);
           // Get the next component handle
            Component := ComponentIteratorHandle.NextPCBObject;

        end;

        // Notify the pcbserver that all changes have been made
        PCBServer.PostProcess;

        //Refresh the screen
        Client.SendMessage('PCB:Zoom', 'Action=Redraw' , 255, Client.CurrentView);

        // Destroy the component handle
        PCBServer.GetCurrentPCBBoard.BoardIterator_Destroy(ComponentIteratorHandle);

    finally
           // Restore DRC setting
           PCBSystemOptions.DoOnlineDRC :=  DRCSetting;
    end;
end;

{..............................................................................}

