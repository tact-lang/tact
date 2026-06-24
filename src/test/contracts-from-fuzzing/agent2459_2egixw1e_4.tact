struct OptNested {
  val: Int?;
  flag: Bool?;
}

contract TestContract {
  data: OptNested;

  init() {
    self.data = OptNested{
      val: null,
      flag: true
    };
  }
}