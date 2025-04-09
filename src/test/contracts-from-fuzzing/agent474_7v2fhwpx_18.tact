struct Packed {
  a: Int as uint8;
  b: Int as uint8;
  c: Int as uint8;
  d: Int as uint8;
}

struct Outer {
  i: Int;
  st: Packed;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      i: 123,
      st: Packed{ a:5, b:6, c:7, d:8 }
    };
  }
}
