struct OptionalStruct {
  inner: Int?;
}

contract Test33 {
  field: OptionalStruct?;

  init() {
    self.field = OptionalStruct{inner: null};
  }
}