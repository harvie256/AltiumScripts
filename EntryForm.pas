
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


