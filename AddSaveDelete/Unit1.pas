unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    TelNo: TLabel;
    ?sim: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  secim:integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
if ListBox1.Items.IndexOf(Edit1.Text)<0 then
begin
    if (Edit1.Text<>'') or (Edit2.Text<>'') or (Edit3.Text<>'') then
    begin
ListBox1.Items.Add(Edit1.Text);
ListBox2.Items.Add(Edit2.Text);
ListBox3.Items.Add(Edit3.Text);

Edit1.Clear;
Edit2.Clear;
Edit3.Clear;

    end
    else
    ShowMessage('bo? alan kayd? yap?lmaz l?tfen en az bir alan? doldurunuz. ');
end
else
begin
ShowMessage('Bu numara zaten kay?tl?, l?tfen kontrol edip tekrar giriniz.');
ListBox1.ItemIndex := ListBox1.Items.IndexOf(Edit1.Text);
ListBox1Click(ListBox1);
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
         ListBox2.Items.Delete(secim);
         ListBox1.Items.Delete(secim);
         ListBox3.Items.Delete(secim);


end;

procedure TForm1.Button3Click(Sender: TObject);
begin
ListBox1.Items.SaveToFile('C:\Users\Yunus\OneDrive\Documents\telno.txt');
ListBox2.Items.SaveToFile('C:\Users\Yunus\OneDrive\Documents\isim.txt');
ListBox3.Items.SaveToFile('C:\Users\Yunus\OneDrive\Documents\soyisim.txt');
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
Button1.Default:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 ListBox1.Items.LoadFromFile('C:\Users\Yunus\OneDrive\Documents\telno.txt');
 ListBox2.Items.LoadFromFile('C:\Users\Yunus\OneDrive\Documents\isim.txt');
 ListBox3.Items.LoadFromFile('C:\Users\Yunus\OneDrive\Documents\soyisim.txt');

end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
     secim:=ListBox1.ItemIndex;
     ListBox2.ItemIndex:=secim;
     ListBox3.ItemIndex:=secim;

end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
      secim:=ListBox2.ItemIndex;
     ListBox1.ItemIndex:=secim;
     ListBox3.ItemIndex:=secim;


end;

procedure TForm1.ListBox3Click(Sender: TObject);
begin
     secim:=ListBox3.ItemIndex;
     ListBox1.ItemIndex:=secim;
     ListBox2.ItemIndex:=secim;

end;

end.
