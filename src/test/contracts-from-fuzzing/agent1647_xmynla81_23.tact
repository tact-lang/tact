struct AllPrims {
  i: Int;
  b: Bool;
  s: String;
  a: Address;
  c: Cell;
  sl: Slice;
  bl: Builder;
  optI: Int?;
  optB: Bool?;
  optS: String?;
  optA: Address?;
}

contract Test {
  st: AllPrims;

  init() {
    self.st = AllPrims{
      i: 10,
      b: true,
      s: "hi",
      a: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
      c: emptyCell(),
      sl: emptyCell().asSlice(),
      bl: beginCell(),
      optI: null,
      optB: null,
      optS: null,
      optA: null
    };
  }
}
