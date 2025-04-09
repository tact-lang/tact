// persistent of struct containing string optional string bool optional bool
struct Combo {
  a:String;
  b:String?;
  c:Bool;
  d:Bool?;
}
contract ComboTest {
  c:Combo;
  init() {
    self.c=Combo{
      a:"a", b:null, c:true, d:null
    };
  }
}
