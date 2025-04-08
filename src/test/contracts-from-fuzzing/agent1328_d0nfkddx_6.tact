struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract NestTest {
    v: C;
    init() {
        self.v = C{ b: B{ a: A{ x: 42 } } };
    }
}