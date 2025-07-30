struct Packed {
  a: Int as uint32;
  b: Int as uint32;
  c: Int as uint32;
}

contract PackedTest {
  data: Packed;

  init() {
    self.data = Packed{ a:1, b:2, c:3 };
  }
}
