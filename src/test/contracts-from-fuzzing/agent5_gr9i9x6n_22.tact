struct NonDefault {
  foo: Int;
  bar: Bool;
}

contract NoDefaultsInit {
  item: NonDefault;

  init() {
    self.item = NonDefault{
      foo: 10,
      bar: true
    };
  }

  receive() {
    let _ = self.item.foo;
  }
}
