struct OptStruct {
  x: Int?;
  y: Bool?;
}

contract OptionalStructFieldNullable {
  data: OptStruct?;

  init() {
    self.data = OptStruct{
      x: 5,
      y: null,
    };
  }
}
