// A contract with large persistent struct containing all primitive types
struct AllPrim {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Builder;
  f: Slice;
  g: String;
}

contract AllPrimContract {
  data: AllPrim;

  init() {
    self.data = AllPrim{
      a: 1,
      b: false,
      c: myAddress(),
      d: emptyCell(),
      e: beginCell(),
      f: emptyCell().asSlice(),
      g: "test"
    };
  }
}
