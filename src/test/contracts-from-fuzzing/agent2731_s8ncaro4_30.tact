struct DeepOpt {
  foo: Int?;
  bar: String?;
}

struct Deep2 {
  x: DeepOpt?;
  y: Bool;
}

contract NestedOptField {
  nested: Deep2;

  init() {
    self.nested = Deep2{x:null,y:true};
  }
}