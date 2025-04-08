struct A { f:Int; }
contract FieldsOrderTest {
  a:A;
  b:Int;
  c:Bool;
  d:String;

  init() {
    self.a = A{f:1};
    self.b = 2;
    self.c = true;
    self.d = "hi";
  }
}