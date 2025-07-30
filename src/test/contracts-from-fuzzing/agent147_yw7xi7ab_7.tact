struct NestedOpt {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract Test {
  val: NestedOpt;

  init() {
    self.val = NestedOpt{
      x: null,
      y: null,
      z: null,
    };
  }
}