struct DeepOptDefaults {
  foo: Int? = null;
  sub: Inner? = null;
}

struct Inner {
  val: Int? = null;
}

contract DeepDefaultTest {
  data: DeepOptDefaults;

  init() {
    self.data = DeepOptDefaults{};
  }
}
