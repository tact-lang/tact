struct OptStruct {
  a: Int?;
  b: String?;
}

contract OptionalInStruct {
  data: OptStruct?;

  init() {
    self.data = OptStruct{a:5, b:null};
  }
}