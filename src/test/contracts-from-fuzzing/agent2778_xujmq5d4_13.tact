struct EmptyIntOpt {
  foo: Int?;
}

contract DefaultOptContract {
  field: EmptyIntOpt;

  init() {
    self.field = EmptyIntOpt{ foo: null };
  }
}
