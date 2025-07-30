struct Outer {
  a: Int;
  b: Bool;
  c: Inner;
}

struct Inner {
  s: String;
  addr: Address;
  cell: Cell;
  sl: Slice;
}

contract NestedFields {
  val: Outer;
  init() {
    self.val = Outer{
      a: 1,
      b: true,
      c: Inner{
        s:"s", addr:myAddress(), cell:emptyCell(), sl:emptyCell().asSlice()
      }
    };
  }
}