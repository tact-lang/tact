struct Base {
  foo: Int;
}

struct Base2 {
  bar: String?;
}

struct Container {
  a: Base;
  b: Base2;
}

contract CombinedStructs {
  val: Container;

  init() {
    self.val = Container{
      a: Base{foo: 7},
      b: Base2{bar: null}
    };
  }
}
