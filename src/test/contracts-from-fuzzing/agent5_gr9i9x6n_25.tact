struct SomeOpt {
  foo: Int?;
}

contract DefaultNullOptional {
  myopt: SomeOpt;

  init() {
    self.myopt = SomeOpt{ foo: null };
  }

  receive() {
    if (self.myopt.foo != null) {
      let _ = self.myopt.foo!!;
    }
  }
}
