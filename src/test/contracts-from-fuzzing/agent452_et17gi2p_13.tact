struct SerializedFields {
  s1: Int as int32;
  s2: Int as uint8;
  opt: Bool?;
}

contract SerStruct {
  data: SerializedFields;

  init() {
    self.data = SerializedFields{
      s1: -123456,
      s2: 200,
      opt: null,
    };
  }
}