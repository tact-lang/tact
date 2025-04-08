struct DefaultedOptionals {
  foo: Int? = null;
  bar: Bool? = null;
  str: String? = null;
  s: Simple? = null;
}

struct Simple {
  value: Int;
}

contract TestDefaultedOptionals {
  data: DefaultedOptionals;

  init() {
    self.data = DefaultedOptionals{
      foo: null,
      bar: null,
      str: null,
      s: null
    };
  }
}
