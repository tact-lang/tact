struct InlineOptional {
  val: String?;
}

contract OptionalExplicitNull {
  data: InlineOptional;

  init() {
    self.data = InlineOptional{
      val: null,
    };
  }
}