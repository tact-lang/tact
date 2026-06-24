struct ComplexType {
  a: Int?;
  b: Bool;
  c: String?;
  d: Cell;
  e: Slice;
  f: Address;
}

contract ComplexState {
  data: ComplexType;
  init() { self.data = ComplexType{ a: null, b: true, c: null, d: emptyCell(), e: emptyCell().asSlice(), f: myAddress() }; }
}