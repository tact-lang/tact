struct P {
  x: Int as int64;
  y: Int as int64;
}

struct L {
  s: P;
  e: P;
}

contract Serialized {
  line: L;
  init() {
    self.line = L{
      s: P{x:1,y:2},
      e: P{x:3,y:4}
    };
  }
}