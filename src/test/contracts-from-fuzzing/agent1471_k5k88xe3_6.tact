struct OptionalInStruct {
  val1: Int?;
  val2: Bool?;
}

contract OptionalStructField {
  st: OptionalInStruct;

  init() {
    self.st = OptionalInStruct{
      val1: null,
      val2: true
    };
  }
}