struct Combo {
  i: Int;
  b: Bool;
  s: String;
  a: Address;
  c: Cell;
  sl: Slice;
  oi: Int?;
  ob: Bool?;
  os: String?;
  oa: Address?;
}

contract ComboStorage {
  combo: Combo;

  init() {
    self.combo = Combo{
      i: 1,
      b: false,
      s: "s",
      a: myAddress(),
      c: emptyCell(),
      sl: emptyCell().asSlice(),
      oi: 7,
      ob: null,
      os: null,
      oa: null
    };
  }
}