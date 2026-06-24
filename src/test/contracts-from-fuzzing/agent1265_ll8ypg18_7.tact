struct OptLayer {
  o1: Int?;
  o2: String?;
  o3: Bool?;
}

contract OptionalFields {
  opts: OptLayer;

  init() {
    self.opts = OptLayer{
      o1: null,
      o2: "hello",
      o3: true,
    };
  }
}