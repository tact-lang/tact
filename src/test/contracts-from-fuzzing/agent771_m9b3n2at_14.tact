struct MultipleTypes {
  i: Int;
  b: Bool;
  a: Address;
  c: Cell;
  s: Slice;
  str: String;
}

contract MultiStructTest {
  m: MultipleTypes;

  init() {
    self.m = MultipleTypes{
      i: 1,
      b: true,
      a: myAddress(),
      c: emptyCell(),
      s: emptyCell().asSlice(),
      str: "hi",
    };
  }
}