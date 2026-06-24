struct A {
  a1: Int;
}

struct B {
  b1: Int;
  a: A;
}

struct C {
  c1: Int;
  b: B;
}

contract TestContract {
    value: C;

    init() {
        self.value = C{
            c1: 3,
            b: B{
                b1: 2,
                a: A{ a1: 1 }
            }
        };
    }
}