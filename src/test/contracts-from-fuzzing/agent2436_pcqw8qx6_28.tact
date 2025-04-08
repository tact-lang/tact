struct OptionalNested {
  inner: StructOpt?;
}

struct StructOpt {
  f: Bool;
}

contract OptNestedTest {
  f: OptionalNested;

  init() {
    self.f = OptionalNested{inner:null};
  }
}