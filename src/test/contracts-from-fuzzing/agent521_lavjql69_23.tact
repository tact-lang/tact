// Test optional Slice, Cell, Address with null assignments
struct Optionals {
  s: Slice?;
  c: Cell?;
  a: Address?;
}

contract SliceCellAddrOptional {
  f: Optionals;
  init() {
    self.f = Optionals{
      s: null,
      c: null,
      a: null,
    };
  }
}