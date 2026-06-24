struct OptionalStruct {
  num: Int?;
  flag: Bool?;
  txt: String?;
}

contract OptionalFields {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{
      num: null,
      flag: null,
      txt: null,
    };
  }
}