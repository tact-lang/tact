struct A {
  flag: Bool;
}

struct B {
  a: A;
}

struct C {
  b: B;
}

contract UseDefaults {
    c: C = C{ b: B{ a: A{ flag: true } } };

    init() {
        self.c = C{ b: B{ a: A{ flag: false } } };
    }
}