struct Mix {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Address;
}

contract MixFields {
  s: Mix;

  init() {
    self.s = Mix {
      a: 1,
      b: true,
      c: "yo",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: myAddress(),
    };
  }
}