struct DeepOptional {
  one: Int?;
  two: Bool?;
  three: String?;
  four: Cell?;
}

contract OptionalPrimitives {
  val: DeepOptional;

  init() {
    self.val = DeepOptional{
      one: null,
      two: null,
      three: null,
      four: null
    };
  }
}
