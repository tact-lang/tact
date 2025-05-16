struct NestedOptionals2 {
  foo: Int?;
  bar: SubOpt?;
}

struct SubOpt {
  x: Int?;
  y: Bool?;
}

contract TestNestedOpt2 {
  x: NestedOptionals2;

  init() {
    self.x = NestedOptionals2{foo:null, bar:null};
  }
}
