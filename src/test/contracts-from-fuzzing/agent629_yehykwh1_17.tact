struct C {
    x: Int;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

contract Test {
    a: A;
    init() {
        self.a = A{ b: B{ c: C{ x: 99 } } };
    }
}
