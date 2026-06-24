struct NestedOptionalStruct {
    a: Int;
    b: Bool?;
}

contract OptionalStructField {
    field: NestedOptionalStruct?;
    
    init() {
      self.field = null;
    }
}