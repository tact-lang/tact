struct Combo {
  n: Int;
  flag: Bool;
  txt: String;
  data: Cell;
  sl: Slice;
  addr: Address;
  optInt: Int?;
  optStr: String?;
}

contract MixedFields {
  combo: Combo;

  init() {
    self.combo = Combo{
      n: 1,
      flag: false,
      txt: "tact",
      data: emptyCell(),
      sl: emptyCell().asSlice(),
      addr: myAddress(),
      optInt: null,
      optStr: null
    };
  }
}