struct Combo {
  a: Int;
  b: Bool;
  c: String;
  d: Cell;
  e: Slice;
  f: Builder;
  g: Address;
}

contract ComboTest {
  data: Combo;

  init() {
    self.data = Combo{
      a: 1,
      b: true,
      c: "hello",
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: beginCell(),
      g: myAddress()
    };
  }
}