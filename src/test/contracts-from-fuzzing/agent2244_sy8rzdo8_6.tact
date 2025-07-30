struct A {
  foo: Int;
}

struct B {
  nested: A;
}

struct C {
  nested: B;
}

struct D {
  nested: C;
}

struct E {
  nested: D;
}

contract LongChain {
  val: E;

  init() {
    self.val = E{
      nested: D{
        nested: C{
          nested: B{
            nested: A{foo: 123}
          }
        }
      }
    };
  }
}
