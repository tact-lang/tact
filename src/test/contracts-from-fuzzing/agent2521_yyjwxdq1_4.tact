struct BigS {
  int1: Int;
  int2: Int;
  flag: Bool;
  addr: Address?;
  s: String;
  cell: Cell;
  sl: Slice;
}

contract DeepPersist {
  big: BigS;

  init() {
    self.big = BigS{
      int1: 10,
      int2: -20,
      flag: true,
      addr: null,
      s: "deep",
      cell: emptyCell(),
      sl: emptyCell().asSlice(),
    };
  }
}
