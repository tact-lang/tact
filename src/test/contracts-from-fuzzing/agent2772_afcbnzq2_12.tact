struct OptionalStruct {
  s: InnerStruct?;
}

struct InnerStruct {
  val: Int;
}

contract TestOptionalStructField {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{
      s: InnerStruct{val: 7}
    };
  }
}
