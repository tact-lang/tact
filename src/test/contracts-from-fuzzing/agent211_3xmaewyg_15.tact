struct EmptyStringStruct {
  val: String;
}

contract EmptyStringField {
  data: EmptyStringStruct;

  init() {
    self.data = EmptyStringStruct{
      val: "",
    };
  }
}
