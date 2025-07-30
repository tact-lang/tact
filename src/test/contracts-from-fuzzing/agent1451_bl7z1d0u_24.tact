struct EdgeCase {
  a: Int as uint1;
  b: Int as int1;
}

contract TinyInts {
  vals: EdgeCase;

  init() {
    self.vals = EdgeCase{
      a:1,
      b:0
    };
  }
}
