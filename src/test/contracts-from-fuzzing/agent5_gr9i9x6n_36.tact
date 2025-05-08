struct ComplexOptionals {
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
  optAddr: Address?;
  optSlice: Slice?;
  optCell: Cell?;
}

struct Container {
  optComp: ComplexOptionals?;
}

contract OptionalOfComplexOptional {
  field: Container;

  init() {
    self.field = Container{ optComp: null };
  }

  receive() {
    if (self.field.optComp != null) {
      let _ = self.field.optComp!!.optCell;
    }
  }
}
