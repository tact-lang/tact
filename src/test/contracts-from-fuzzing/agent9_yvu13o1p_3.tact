struct A {
  f1: Int;
}

struct B {
  f2: A;
}

struct C {
  f3: B;
}

struct D {
  f4: C;
}

struct E {
  f5: D;
}

contract TestContract {
    nested: E;
    num: Int;

    init() {
        self.nested = E{ f5: D{ f4: C{ f3: B{ f2: A{ f1: 123 }}}}};
        self.num = 7;
    }

    receive() {
        self.num = 8;
    }
}