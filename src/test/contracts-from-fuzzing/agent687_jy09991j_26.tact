struct ScalarTypes {
  i: Int;
  b: Bool;
  s: String;
  a: Address;
  c: Cell;
  sl: Slice;
}

contract ScalarFields {
  val: ScalarTypes;

  init() {
    self.val = ScalarTypes{
      i: 12, b: false, s: "foo", a: myAddress(), c: emptyCell(), sl: emptyCell().asSlice()
    };
  }
}