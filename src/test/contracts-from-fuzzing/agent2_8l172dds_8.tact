struct A {
  val: Int;
}

struct B {
  a: A;
}

struct C {
  b: B;
}

struct D {
  c: C;
}

struct E {
  d: D;
}

contract Test {
  deeplyNested: E;

  init() {
    self.deeplyNested = E{
      d: D{
        c: C{
          b: B{
            a: A{val: 42}
          }
        }
      }
    };
  }
}