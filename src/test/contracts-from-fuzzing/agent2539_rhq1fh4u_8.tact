struct InnerDefault {
  val: Int = 777;
  flag: Bool = true;
}

contract DefaultsNested {
  innerField: InnerDefault;

  init() {
    self.innerField = InnerDefault{};
  }
}