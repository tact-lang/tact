struct Child {
  foo: Int;
}

struct Parent {
  bar: Child;
}

struct Grand {
  baz: Parent;
}

contract VeryDeepNest {
  q: Grand;

  init() {
    self.q = Grand{
      baz: Parent{
        bar: Child{
          foo: 123
        }
      }
    };
  }
}