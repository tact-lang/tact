// Mix bools, ints, optional int, optional bool
contract MixTypes {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  init() {
    self.a=1; self.b=true; self.c=null; self.d=null;
  }
}
