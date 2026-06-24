struct MiddleAlt {
  x: Int;
  y: String;
}

struct OuterAlt {
  inner1: MiddleAlt;
  inner2: MiddleAlt;
}

contract MultiInner {
  nested: OuterAlt;
  init() {
    self.nested = OuterAlt{
      inner1: MiddleAlt{x:1,y:"a"},
      inner2: MiddleAlt{x:2,y:"b"}
    };
  }
}