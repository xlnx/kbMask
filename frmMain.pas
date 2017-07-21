unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    btnMask: TBitBtn;
    procedure btnMaskClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  WH_KEYBOARD_LL: Integer = 13;

var
  Form1: TForm1;
  is_masked: Boolean;
  hook_h: HHOOK;

implementation

{$R *.dfm}

function kb_proc(nCode: Integer; wp: WPARAM; lp: LPARAM): LRESULT;
begin
  Result := 1;
end;

procedure TForm1.btnMaskClick(Sender: TObject);
begin
  if is_masked then
  begin
    if UnhookWindowsHookEx(hook_h) then
    begin
      btnMask.Caption := '&Mask';
      is_masked := False;
    end
    else
    begin
      Application.MessageBox(PChar('Failed to unhook.'), PChar('Unhook Error'),
        MB_OK + MB_ICONWARNING);
    end;
  end
  else
  begin
    hook_h := SetWindowsHookEx(WH_KEYBOARD_LL, @kb_proc, GetModuleHandle(nil), 0);
    if (hook_h = 0) then
    begin
      Application.MessageBox(PChar('Failed to hook.'), PChar('Hook Error'), MB_OK
        + MB_ICONWARNING);
    end
    else
    begin
      btnMask.Caption := '&Unmask';
      is_masked := True;
    end;
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if is_masked then
  begin
    if UnhookWindowsHookEx(hook_h) then
    begin
      btnMask.Caption := '&Mask';
      is_masked := False;
    end
    else
    begin
      Application.MessageBox(PChar('Failed to unhook.'), PChar('Unhook Error'),
        MB_OK + MB_ICONWARNING);
    end;
  end
end;

initialization
  is_masked := False;

end.
