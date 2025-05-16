struct MixTypes {
  n: Int;
  f: Bool;
  addr: Address;
  s: String;
  slice: Slice;
  cell: Cell;
}

contract MixedStorage {
  mixed: MixTypes;

  init() {
    self.mixed = MixTypes{
      n: 42,
      f: true,
      addr: myAddress(),
      s: "hello",
      slice: emptyCell().asSlice(),
      cell: emptyCell()
    };
  }
}