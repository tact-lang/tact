// Struct with mixed primitive types and serialization
struct Mixed {
  a: Int;
  b: Int as uint8;
  c: Int as int16;
  d: Bool;
  e: String;
  f: Address;
  g: Slice;
}

contract TestContract {
  m: Mixed;

  init() {
    self.m = Mixed{
      a: 1,
      b: 2,
      c: -3,
      d: true,
      e: "hi",
      f: myAddress(),
      g: emptyCell().asSlice()
    };
  }
}