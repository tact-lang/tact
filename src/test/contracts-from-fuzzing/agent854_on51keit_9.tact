struct MixTypes {
  i: Int;
  b: Bool;
  s: String;
  addr: Address;
  c: Cell;
  sl: Slice;
}

contract MixTypesContract {
  data: MixTypes;

  init() {
    self.data = MixTypes{
      i: 1,
      b: true,
      s: "s",
      addr: myAddress(),
      c: emptyCell(),
      sl: emptyCell().asSlice(),
    };
  }
}