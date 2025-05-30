struct MixA {
  foo: Int;
  bar: String;
}

struct MixB {
  foo: Bool;
  bar: Slice;
}

struct MixC {
  foo: Address;
  bar: Cell;
}

contract MixedStructs {
  a: MixA;
  b: MixB;
  c: MixC;

  init() {
    self.a = MixA{ foo: 1, bar: "x" };
    self.b = MixB{ foo: false, bar: emptyCell().asSlice() };
    self.c = MixC{ foo: myAddress(), bar: emptyCell() };
  }
}