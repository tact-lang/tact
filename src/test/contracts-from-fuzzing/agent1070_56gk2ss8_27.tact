struct Packed {
  a: Int;
  b: Bool;
  c: Int as uint8;
  d: Int as uint16;
  e: Int as int32;
  f: Bool?;
  g: String;
}

contract Packing {
  x: Packed;

  init() {
    self.x = Packed{
      a: 1,
      b: true,
      c: 4,
      d: 1234,
      e: -12,
      f: null,
      g: "done"
    };
  }
}