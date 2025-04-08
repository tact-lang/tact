struct LotsOfFields {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Address;
  f: Bool;
  g: String;
  h: Address;
  i: Int;
  j: Cell;
}

contract ManyFieldsTest {
  item: LotsOfFields;

  init() {
    self.item = LotsOfFields{
      a: 1,
      b: true,
      c: "a",
      d: emptyCell(),
      e: myAddress(),
      f: false,
      g: "b",
      h: myAddress(),
      i: 42,
      j: emptyCell(),
    };
  }
}