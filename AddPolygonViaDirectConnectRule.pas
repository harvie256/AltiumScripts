Procedure CreatePolygonViaDirectConnectRule;
var
   PCBBoard                      :  IPCB_Board;
   Rule                          :  IPCB_PolygonConnectStyleRule;


Begin
     PCBBoard := PCBServer.GetCurrentPCBBoard;
     If PCBBoard = Nil Then Exit;

     Rule := PCBServer.PCBRuleFactory(eRule_PolygonConnectStyle);


     Rule.Scope1Expression := 'IsVia';
     Rule.Scope2Expression := '';

     Rule.NetScope  := eNetScope_AnyNet;

     Rule.Name := 'PolygonViaDirectConnect';
     Rule.ConnectStyle := eDirectConnectToPlane;

     PCBBoard.AddPCBObject(Rule);  
End;

