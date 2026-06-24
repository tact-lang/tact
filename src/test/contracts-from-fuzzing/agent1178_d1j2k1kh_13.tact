struct MultiOpt {
  x: Int?;
  y: String?;
  z: Bool?;
}

contract Test {
  data: MultiOpt;

  init() {
    self.data = MultiOpt{
      x: null,
      y: null,
      z: true,
    };
  }
}