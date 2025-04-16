struct OptionalInStruct {
  inner: InnerStruct?;
}

struct InnerStruct {
  num: Int as uint32;
  flag: Bool;
}

contract OptionalSerialization {
  data: OptionalInStruct;

  init() {
    self.data = OptionalInStruct{
      inner: null
    };
  }
}