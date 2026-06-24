struct StructWithSerialization {
  num: Int as uint32;
  flag: Bool;
  txt: String;
}

contract TestContract {
  data: StructWithSerialization;
  init() {
    self.data = StructWithSerialization{
      num: 25,
      flag: true,
      txt: "serialize",
    };
  }
}