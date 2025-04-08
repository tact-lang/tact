struct SubX {
 x: Int;
}
struct SubY {
 y: Int;
}

contract ManyNestedSubs {
  a: SubX;
  b: SubY;
  c: Int;
  d: String;

  init() {
    self.a=SubX{x:1};
    self.b=SubY{y:2};
    self.c=3;
    self.d="ok";
  }
}