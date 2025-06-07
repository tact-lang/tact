// many bool and optional bool fields
contract ManyBools {
  a: Bool;
  b: Bool;
  c: Bool?;
  d: Bool?;
  e: Bool;

  init() {
    self.a=true; self.b=false;
    self.c=null; self.d=null;
    self.e=true;
  }
}