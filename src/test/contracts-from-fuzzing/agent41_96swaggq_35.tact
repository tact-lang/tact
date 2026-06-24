struct Messy {
  i: Int;
  b: Bool;
}

struct HasMessy {
  foo: Messy;
  optFoo: Messy?;
}

contract MessyTest {
  s: HasMessy;

  init() {
    self.s = HasMessy{
      foo: Messy{ i:10, b:true },
      optFoo: null
    };
  }
}
