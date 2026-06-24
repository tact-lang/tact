struct StructStringOpt {
  s: String?;
}

contract TestStructStringOpt {
  foo: StructStringOpt;

  init() {
    self.foo = StructStringOpt{s:null};
  }
}
