struct OptStruct {
  field1: Int?;
  field2: Bool?;
  field3: String?;
}

contract OptNested {
  data: OptStruct;
  
  init() {
    self.data = OptStruct{
      field1: null,
      field2: true,
      field3: null
    };
  }
}
