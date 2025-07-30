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

struct Container {
  d: D;
  flag: Bool;
}

contract UltraNested {
  v: Container;

  init() {
    self.v = Container{
      d: D{
        c: C{
          b: B{
            a: A{ val: 42 }
          }
        }
      },
      flag: false
    };
  }
}