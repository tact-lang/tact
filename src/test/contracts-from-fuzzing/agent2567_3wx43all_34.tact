struct VariousTypes {
  a: Int;
  b: Int?;
  c: String;
  d: Slice;
  e: Bool;
  f: Address;
  g: Cell;
}

contract TestVariousTypes {
  f: VariousTypes;
  init() {
    self.f = VariousTypes{
      a:1,
      b:null,
      c:"qq",
      d:emptyCell().asSlice(),
      e:true,
      f:myAddress(),
      g:emptyCell()
    };
  }
}