// Compose with int, bool, string, address, cell, slice, optionals, with defaults
struct MixAll {
  i: Int = 42;
  b: Bool = true;
  s: String = "hi";
  a: Address;
  c: Cell;
  sl: Slice;
  oi: Int?;
  os: String? = null;
}

contract MixAllFields {
  all: MixAll;

  init() {
    self.all = MixAll{
      a: myAddress(),
      c: emptyCell(),
      sl: emptyCell().asSlice(),
      oi: 7,
    };
  }
}