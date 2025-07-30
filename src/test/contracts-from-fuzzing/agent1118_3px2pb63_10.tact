struct MixPrimitives {
  i: Int;
  s: String;
  b: Bool;
  a: Address;
  c: Cell;
  sl: Slice;
}

contract MixedTypesTest {
  data: MixPrimitives;

  init() {
    self.data = MixPrimitives{
      i: 42,
      s: "hi",
      b: true,
      a: myAddress(),
      c: emptyCell(),
      sl: emptyCell().asSlice()
    };
  }
}