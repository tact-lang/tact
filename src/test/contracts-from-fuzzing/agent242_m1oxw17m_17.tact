struct InnerStruct {
  field: Int;
}

contract OptionalInnerStruct {
  data: InnerStruct?;

  init() {
    self.data = null;
  }
}