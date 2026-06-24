struct S1 {
  a: Int as uint8;
  b: Int as int16;
  c: Bool;
  d: Address;
  e: String;
  f: Cell;
  g: Slice;
}

contract ManyTypesStorage {
  x: S1;

  init() {
    self.x = S1{
      a: 1,
      b: -1234,
      c: true,
      d: myAddress(),
      e: "Hello",
      f: emptyCell(),
      g: emptyCell().asSlice()
    };
  }

  receive() {
    let _ = self.x.b;
  }
}
