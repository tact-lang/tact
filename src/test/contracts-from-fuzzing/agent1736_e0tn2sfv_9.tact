struct DeepOptionalLevel2 {
  name: String?;
  flag: Bool?;
}

struct DeepOptionalLevel1 {
  nested: DeepOptionalLevel2?;
  val: Int;
}

contract DeepOptionals {
  state: DeepOptionalLevel1;

  init() {
    self.state = DeepOptionalLevel1{
      nested: null,
      val: 123
    };
  }
}