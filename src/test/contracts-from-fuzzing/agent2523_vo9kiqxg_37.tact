// optional serial field
contract OptSerial {
  a: Int as uint32;
  b: Int?;
  c: Int as coins;
  init() {
    self.a=1; self.b=null; self.c=ton("0.5");
  }
}