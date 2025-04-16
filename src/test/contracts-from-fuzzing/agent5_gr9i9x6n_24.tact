struct SerialOrderTest {
  a: Int as uint8;
  b: Int as int16;
  c: Bool;
  d: Address;
  e: String;
  f: Cell;
  g: Slice;
}

contract FieldOrder {
  payload: SerialOrderTest;

  init() {
    self.payload = SerialOrderTest{
      a: 1,
      b: -321,
      c: true,
      d: myAddress(),
      e: "str",
      f: emptyCell(),
      g: emptyCell().asSlice()
    };
  }

  receive() {
    let _ = self.payload.f;
  }
}
