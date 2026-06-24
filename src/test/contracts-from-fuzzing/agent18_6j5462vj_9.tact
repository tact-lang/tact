struct ManyTypes {
  i: Int;
  b: Bool;
  s: String;
  sl: Slice;
  bu: Builder;
  ce: Cell;
  a: Address;
}

contract Combo {
  foo: ManyTypes;

  init() {
    self.foo = ManyTypes{
      i: 1,
      b: false,
      s: "hi",
      sl: emptyCell().asSlice(),
      bu: beginCell(),
      ce: emptyCell(),
      a: myAddress()
    };
  }
}