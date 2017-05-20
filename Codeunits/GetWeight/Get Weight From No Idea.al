codeunit 72050034 "Get Weight From No Idea"
{
  // version Exercise 4


  trigger OnRun();
  begin
  end;

  [EventSubscriber(ObjectType::Codeunit, 72050012, 'GetWeightEvent', '', false, false)]
  LOCAL PROCEDURE GetWightFromNoIdea(VAR Rec : Variant;VAR WeightArguments : Record 72050098;VAR Handled : Boolean);
  var
    GetWeightFromScaleFacade : Codeunit 72050012;
  begin
    IF Handled THEN // Test Near
      EXIT;

    IF GetWeightFromScaleFacade.GetCodeunitIDFromScaleSetup <> CODEUNIT::"Get Weight From No Idea" THEN // Test Far
      EXIT;

    WITH WeightArguments DO // Do It
      Weight := 238695;

    Handled := TRUE; // Clean Up
  end;

  [EventSubscriber(ObjectType::Page, 72050025, 'OnOpenPageEvent', '', true, true)]
  LOCAL PROCEDURE RegisterScale(VAR Rec : Record 72050025);
  var
    Scale : Record 72050025;
  begin
    WITH Rec DO BEGIN
      IF GET('NOIDEA') THEN
        EXIT;
      INIT;
      Code := 'NOIDEA';
      Description := 'No Idea What Brand Of Scale';
      "Codeunit ID" := CODEUNIT::"Get Weight From No Idea";
      INSERT;
    END;
  end;
}
