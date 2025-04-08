struct NestedOptionals {
  strOpt: String?;
  boolOpt: Bool?;
  cellOpt: Cell?;
  sliceOpt: Slice?;
  addrOpt: Address?;
}

struct ComplexStruct {
  num: Int;
  nested: NestedOptionals?;
}

contract TestContract {
  data: ComplexStruct;

  init() {
    self.data = ComplexStruct{
      num: 42,
      nested: NestedOptionals{
        strOpt: null,
        boolOpt: true,
        cellOpt: emptyCell(),
        sliceOpt: emptyCell().asSlice(),
        addrOpt: null,
      }
    };
  }
}
