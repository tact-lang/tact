struct NestedOptionals {
  a: Int?;
  b: Inner?;
}

struct Inner {
  c: Int?;
  d: Bool?;
}

contract DeepOptionals {
  field: NestedOptionals = NestedOptionals{a:null, b:null};

  init() {
    self.field = NestedOptionals{a:null, b:Inner{c:null, d:null}};
  }
}