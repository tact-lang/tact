struct ComplexStruct {
  i1: Int;
  b1: Bool;
  s1: String;
  a1: Address;
  c1: Cell;
  sl1: Slice;
}

contract TestComplexCombination {
  data: ComplexStruct;

  init() {
      self.data = ComplexStruct{
          i1: 1,
          b1: true,
          s1: "str",
          a1: myAddress(),
          c1: emptyCell(),
          sl1: emptyCell().asSlice()
      };
  }
}
