struct VariousTypes {
  n: Int;
  b: Bool;
  s: String;
  a: Address;
  c: Cell;
  sl: Slice;
  bu: Builder;
}

contract StorageVarious {
  d: VariousTypes;

  init() {
    self.d = VariousTypes{
      n: 1,
      b: true,
      s: "hi",
      a: myAddress(),
      c: emptyCell(),
      sl: emptyCell().asSlice(),
      bu: beginCell()
    };
  }
}
