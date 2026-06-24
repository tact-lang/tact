struct OptionalStruct {
  val: Int?;
  text: String?;
  flag: Bool?;
}

contract OptionalContract {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{
      val: null,
      text: null,
      flag: null
    };
  }
}