struct OptStruct {
  x: Int?;
  y: Int?;
}

contract OptStructField {
  field: OptStruct?;

  init() {
    self.field = null;
  }
}