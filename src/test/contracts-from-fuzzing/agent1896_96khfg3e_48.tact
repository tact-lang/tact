struct NestedRem {
  first: Int;
  rest: Slice as remaining;
}

contract RemStructContract {
  val: NestedRem;

  init() {
    self.val = NestedRem{
      first:33,
      rest:emptyCell().asSlice()
    };
  }
}