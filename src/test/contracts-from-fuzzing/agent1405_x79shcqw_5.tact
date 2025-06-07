struct Packed {
  a: Int as uint8;
  b: Int as uint8;
  c: Int as uint8;
  d: Int as uint8;
  e: Int as uint8;
  f: Int as uint8;
  g: Int as uint8;
}

contract PackedContract {
  data: Packed;

  init() {
    self.data = Packed{ a:1, b:2, c:3, d:4, e:5, f:6, g:7 };
  }

  receive() {
    let _ = self.data;
  }
}