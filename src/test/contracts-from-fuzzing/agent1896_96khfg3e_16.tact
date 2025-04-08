struct ManyBooleans {
  a: Bool;
  b: Bool;
  c: Bool;
  d: Bool;
  e: Bool;
  f: Bool;
  g: Bool;
}

contract PackedBools {
  flags: ManyBooleans;

  init() {
    self.flags = ManyBooleans{
      a: true, b: false, c: true, d: false, e: true, f: false, g: true
    };
  }
}