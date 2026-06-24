struct OptionalStruct {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract OptionalStructContract {
  data: OptionalStruct;

  init() {
    self.data = OptionalStruct{ x: null, y: null, z: "hi" };
  }
}
