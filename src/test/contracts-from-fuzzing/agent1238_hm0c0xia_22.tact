struct Sub {
  foo: Int? = null;
  bar: Bool = false;
}

struct Main {
  sub: Sub;
  val: Int;
}

contract OptDefaults {
  data: Main;
  init() {
    self.data = Main{
      sub: Sub{},
      val: 42
    };
  }
}