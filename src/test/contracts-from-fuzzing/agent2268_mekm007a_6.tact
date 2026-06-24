struct DeepOptional {
  foo: Int?;
  nested: Nested?;
}

struct Nested {
  bar: Bool;
}

contract DeepOpt2 {
  val: DeepOptional;
  
  init() {
    self.val = DeepOptional {
      foo: null,
      nested: null
    };
  }
}