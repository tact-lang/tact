struct HasOptionals {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract Test {
  data: HasOptionals;

  init() {
    self.data = HasOptionals{
      x: null,
      y: true,
      z: "hi",
    };
  }
}