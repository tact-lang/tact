struct DefaultOptional {
  x: Int? = null;
  y: Address? = null;
}

contract DefaultOptStruct {
  val: DefaultOptional;

  init() {
    self.val = DefaultOptional{};
  }
}