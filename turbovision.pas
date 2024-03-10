program Ometepe;

uses
  App,
  MsgBox,
  Objects,
  Drivers,
  Views,
  Menus;

type
  TMyApp = object(TApplication)
    procedure InitStatusLine; virtual;
    procedure InitMenuBar; virtual;
end;


procedure TMyApp.InitStatusLine;
  var
    R: TRect;
    P0: PStatusDef;
    P1,P2,P3:PStatusItem;
  begin
    GetExtent(R);
    R.A.Y := R.B.Y - 1;

    P3 := NewStatusKey('~F1~ Hilfe', kbF1, cmHelp, nil);
    P2 := NewStatusKey('~F10~ Menu', kbF10, cmMenu, P3);
    P1 := NewStatusKey('~Alt+X~ Programm beenden', kbAltX, cmQuit, P2);
    P0 := NewStatusDef(0, $FFFF, P1, nil);

    StatusLine := New(PStatusLine, Init(R, NewStatusDef(0, $FFFF,
    NewStatusKey('~Alt+X~ Programm beenden', kbAltX, cmQuit, nil), nil)));
  end;

  procedure TMyApp.InitMenuBar;
    var
      R: TRect;
    begin
      GetExtent(R);
      R.B.Y := R.A.Y + 1;

      MenuBar := New(PMenuBar, Init(R, NewMenu(
      NewSubMenu('~D~atei', hcNoContext, NewMenu(
      NewItem('~B~eenden', 'Alt-X', kbAltX, cmQuit, hcNoContext,
      nil)), nil))));
    end;

var
  MyApp: TMyApp;

begin
  MyApp.Init;
  MessageBox(#3'Herzlich Willkommen bei TV!', nil, mfInformation+mfOKButton);
  MyApp.Run;
  MyApp.Done;
end.
