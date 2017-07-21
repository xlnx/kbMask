unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ImgList, ExtCtrls;

type
  TForm1 = class(TForm)
    btnMask: TBitBtn;
    btn105: TSpeedButton;
    btn106: TSpeedButton;
    btn107: TSpeedButton;
    btn108: TSpeedButton;
    btn109: TSpeedButton;
    btn110: TSpeedButton;
    btn111: TSpeedButton;
    btn112: TSpeedButton;
    btn113: TSpeedButton;
    btn114: TSpeedButton;
    btn115: TSpeedButton;
    btn116: TSpeedButton;
    btn117: TSpeedButton;
    btn118: TSpeedButton;
    btn119: TSpeedButton;
    btn120: TSpeedButton;
    btn121: TSpeedButton;
    btn122: TSpeedButton;
    btn123: TSpeedButton;
    btn124: TSpeedButton;
    btn125: TSpeedButton;
    btn126: TSpeedButton;
    btn127: TSpeedButton;
    btn128: TSpeedButton;
    btn129: TSpeedButton;
    btn130: TSpeedButton;
    btn131: TSpeedButton;
    btn132: TSpeedButton;
    btn133: TSpeedButton;
    btn134: TSpeedButton;
    btn135: TSpeedButton;
    btn136: TSpeedButton;
    btn137: TSpeedButton;
    btn138: TSpeedButton;
    btn139: TSpeedButton;
    btn140: TSpeedButton;
    btn141: TSpeedButton;
    btn142: TSpeedButton;
    btn143: TSpeedButton;
    btn144: TSpeedButton;
    btn145: TSpeedButton;
    btn146: TSpeedButton;
    btn147: TSpeedButton;
    btn148: TSpeedButton;
    btn149: TSpeedButton;
    btn150: TSpeedButton;
    btn151: TSpeedButton;
    btn152: TSpeedButton;
    btn153: TSpeedButton;
    btn154: TSpeedButton;
    btn155: TSpeedButton;
    btn156: TSpeedButton;
    btn157: TSpeedButton;
    btn158: TSpeedButton;
    btn159: TSpeedButton;
    btn160: TSpeedButton;
    btn161: TSpeedButton;
    btn162: TSpeedButton;
    btn163: TSpeedButton;
    btn164: TSpeedButton;
    btn165: TSpeedButton;
    btn166: TSpeedButton;
    btn167: TSpeedButton;
    btn168: TSpeedButton;
    btn169: TSpeedButton;
    btn170: TSpeedButton;
    btn171: TSpeedButton;
    btn172: TSpeedButton;
    btn173: TSpeedButton;
    btn174: TSpeedButton;
    btn175: TSpeedButton;
    btn176: TSpeedButton;
    btn177: TSpeedButton;
    btn178: TSpeedButton;
    btn179: TSpeedButton;
    btn180: TSpeedButton;
    btn181: TSpeedButton;
    btn182: TSpeedButton;
    btn183: TSpeedButton;
    btn184: TSpeedButton;
    btn185: TSpeedButton;
    btn186: TSpeedButton;
    btn187: TSpeedButton;
    btn188: TSpeedButton;
    btn189: TSpeedButton;
    btn190: TSpeedButton;
    btn191: TSpeedButton;
    btn192: TSpeedButton;
    btn193: TSpeedButton;
    btn194: TSpeedButton;
    btn195: TSpeedButton;
    btn196: TSpeedButton;
    btn197: TSpeedButton;
    btn198: TSpeedButton;
    btn199: TSpeedButton;
    btn200: TSpeedButton;
    btn201: TSpeedButton;
    btn202: TSpeedButton;
    btn203: TSpeedButton;
    btn204: TSpeedButton;
    btn205: TSpeedButton;
    btn206: TSpeedButton;
    btn207: TSpeedButton;
    btn208: TSpeedButton;
    shpttttttttttt: TShape;
    il2: TImageList;
    procedure btnMaskClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure kbClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  WH_KEYBOARD_LL: Integer = 13;
  kb_count: Integer = 104;

  non_trans_color: TColor = $000280E0E0;
  trans_color: TColor = clRed;

  kb_dn: Integer = $80000000;

  kb_data_map: array[0..103] of LPARAM = (
    VK_ESCAPE, VK_F1, VK_F2, VK_F3, VK_F4, VK_F5, VK_F6, VK_F7,
    VK_F8, VK_F9, VK_F10, VK_F11, VK_F12,                         // 12
    $C0, $31, $32, $33, $34, $35, $36, $37, $38, $39, $30,        // 23
    $BD, $BB,                                                     // 25
    $51, $57, $45, $52, $54, $59, $55, $49, $4F, $50,             // 35
    $41, $53, $44, $46, $47, $48, $4A, $4B, $4C,                  // 44
    $5A, $58, $43, $56, $42, $4E, $4D,                            // 51
    $DB, $DD, $DC,                                                // 54
    $BA, $DE, $BC, $BE, $BF,                                      // 59
    $A2, $A4, $2C, $91, VK_PAUSE, VK_INSERT, VK_HOME, VK_PRIOR,
    VK_NEXT, VK_DELETE, VK_END,                                   // 70
    VK_NUMLOCK, $67, $69, $63, $61, $65, $64, $66, $68, $62,      // 80
    VK_DECIMAL, VK_DIVIDE, VK_MULTIPLY, $6D, VK_LWIN,    // 85
    VK_APPS, VK_UP, VK_LEFT, VK_RIGHT, VK_DOWN,                   // 90
    VK_BACK, VK_RETURN, $A1, VK_TAB, VK_CAPITAL,             // 95
    $A0, VK_SPACE, VK_SEPARATOR, VK_ADD, $60,                // 100
    $A3, VK_RWIN, $A5
  );

var
  Form1: TForm1;
  is_masked: Boolean;
  hook_h: HHOOK;

  kbd_map: array[0..128] of Boolean;

implementation

{$R *.dfm}

function kb_proc(nCode: Integer; wp: WPARAM; lp: LPARAM): LRESULT; stdcall;
var
  vKey: Cardinal;
  i: Integer;
begin
  //if (ncode < 0) then
    //Result := CallNextHookEx(hook_h, nCode, wp, lp)
  //else begin
    vkey := LOBYTE(PEventMsg(lp)^.message);
    //Form1.mmo1.Lines.Add('$' + IntToHex(vkey, 10));
    Result := 1;
    for i := 0 to kb_count - 1 do
    begin
      if (kb_data_map[i] = vKey) then
      begin
        if not kbd_map[i] then
          Result := CallNextHookEx(hook_h, nCode, wp, lp);
        Break;
      end;
    end;
  //end;
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
    hook_h := SetWindowsHookEx(WH_KEYBOARD_LL, kb_proc, HInstance, 0);
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

procedure TForm1.kbClick(Sender: TObject);
var
  key: TSpeedButton;
  id: Integer;
begin
  key := Sender as TSpeedButton;
  id := key.Tag;
  if (kbd_map[id]) then
    key.Glyph.TransparentColor := non_trans_color
  else
    key.Glyph.TransparentColor := trans_color;
  kbd_map[id] := not kbd_map[id];
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i, id: Integer;
  key: TSpeedButton;
begin
  for i := 0 to kb_count - 1 do
    kbd_map[i] := True;
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[i] is TSpeedButton) then
    begin
      key := Self.Components[i] as TSpeedButton;
      id := key.Tag;
      if (kbd_map[id]) then
        key.Glyph.TransparentColor := trans_color
      else
        key.Glyph.TransparentColor := non_trans_color;
    end;
  end;
end;

initialization
  is_masked := False;

end.
