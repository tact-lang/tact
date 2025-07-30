struct Tiny {
  x: Int as uint4;  // only 0..15
  y: Int as int4;  // -8..7
}

contract TinyStructTest {
  stored: Tiny;

  init() {
    self.stored = Tiny{
      x: 15,
      y: -8
    };
  }
}