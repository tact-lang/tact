struct MixTypes {
  foo: Int;
  bar: Bool;
  baz: String;
  qux: Cell;
  quux: Slice;
  corge: Address;
  grault: Int?;
  garply: Bool?;
}

contract MixTypeTest {
  val: MixTypes;
  init() {
    self.val = MixTypes{
      foo: 1,
      bar: true,
      baz: "hi",
      qux: emptyCell(),
      quux: emptyCell().asSlice(),
      corge: myAddress(),
      grault: null,
      garply: null
    };
  }
}