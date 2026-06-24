struct OptionalStruct {
  name: String = "default";
  age: Int?;
}

contract OptionalFieldTest {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{age: null};
  }
}