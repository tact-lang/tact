struct DefaultOptionals {
  s: String? = null;
  n: Int? = null;
  b: Bool? = null;
}

contract DefaultOptTest {
  data: DefaultOptionals;

  init() {
    self.data = DefaultOptionals{};
  }
}
