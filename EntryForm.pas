
procedure TForm1.btnCurrentCalcClick(Sender: TObject);
begin
     CurrentCalc();
end;

procedure TForm1.btnSCH_SelectFilterClick(Sender: TObject);
begin

     RectangleForm.ShowModal();
end;

procedure TForm1.btnPasteArrayClick(Sender: TObject);
begin
   ResetParameters;
   RunProcess('Sch:SetupArrayPlacement');
end;

procedure TForm1.btnPastePcbArrayClick(Sender: TObject);
begin
   ResetParameters;
   AddStringParameter('Array', 'True');
   RunProcess('PCB:Paste');
end;

                               
procedure TForm1.btnViaDirectConnectClick(Sender: TObject);
begin
     CreatePolygonViaDirectConnectRule();
end;


procedure TForm1.btnUpdateTemplateClick(Sender: TObject);
begin
   ResetParameters;
   AddStringParameter('Action', 'ManageTemplateUpdate');
   //AddStringParameter('ObjectKind', 'Panel');
   //AddStringParameter('ID', 'Filter');
   RunProcess('Sch:UpdateCurrentTemplate');
end;


procedure TForm1.btnRepositionSelectedComponentsClick(Sender: TObject);
begin
   ResetParameters;
   AddStringParameter('RepositionSelected', 'True');
   RunProcess('PCB:PlaceComponent');
end;


procedure TForm1.btnFixAssemTextClick(Sender: TObject);
begin
     AdjustAssemblyText();
end;

