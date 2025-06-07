struct MultiOptionals {
  val1: Int?;
  val2: Bool?;
  val3: String?;
}

contract ManyOpts {
  state: MultiOptionals;
  init() {
    self.state = MultiOptionals{
      val1: null,
      val2: true,
      val3: "hello"
    };
  }
}