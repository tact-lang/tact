struct OptionalDeep {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    flag: Bool?;
}

contract Test {
  payload: OptionalDeep;

  init() {
    self.payload = OptionalDeep{
      inner: null
    };
  }
}
