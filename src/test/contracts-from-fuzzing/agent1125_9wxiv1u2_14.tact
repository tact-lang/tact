struct Combo {
  i: Int;
  b: Bool;
  a: Address;
  c: Cell;
  s: Slice;
  str: String;
  opt_i: Int?;
  opt_b: Bool?;
  opt_a: Address?;
  opt_c: Cell?;
  opt_s: Slice?;
  opt_str: String?;
}

contract ComboContract {
  data: Combo;
  init() {
    self.data = Combo{
      i: 1,
      b: true,
      a: myAddress(),
      c: emptyCell(),
      s: emptyCell().asSlice(),
      str: "hello",
      opt_i: null,
      opt_b: null,
      opt_a: null,
      opt_c: null,
      opt_s: null,
      opt_str: null
    };
  }
}