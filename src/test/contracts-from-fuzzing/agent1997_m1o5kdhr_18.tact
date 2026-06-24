struct Detail {
  a: Int;
  b: Bool;
  c: String;
}

struct DataFull {
  d: Cell;
  e: Slice;
  f: Detail;
}

contract MixedNested {
  state: DataFull;

  init() {
    self.state = DataFull{
      d: emptyCell(),
      e: emptyCell().asSlice(),
      f: Detail{
        a: 1,
        b: true,
        c: "ok"
      }
    };
  }
}
