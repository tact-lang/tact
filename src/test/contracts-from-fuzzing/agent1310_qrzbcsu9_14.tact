struct LargeComposition {
  i: Int;
  b: Bool;
  s: String;
  a: Address;
  c: Cell;
  sl: Slice;
  io: Int?;
  bo: Bool?;
  so: String?;
  ao: Address?;
  co: Cell?;
  slo: Slice?;
}

contract LargeFieldsContract {
  data: LargeComposition;
  init() {
    self.data = LargeComposition{
      i: 1,
      b: true,
      s: "s",
      a: myAddress(),
      c: emptyCell(),
      sl: emptyCell().asSlice(),
      io: null,
      bo: null,
      so: null,
      ao: null,
      co: null,
      slo: null
    };
  }
}