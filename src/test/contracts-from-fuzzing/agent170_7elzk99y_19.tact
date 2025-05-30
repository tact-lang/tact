struct DefaultOptional {
  a: Int? = null;
}

contract DefaultOptionalTest {
  data: DefaultOptional;

  init() {
    self.data = DefaultOptional{};
  }
}