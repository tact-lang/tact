struct A {
    x: Int = 1;
}

struct B {
    a: A = A{ x: 2 };
}

struct C {
    b: B = B{ a: A{ x: 3 } };
}

contract Test {
    c: C = C{ b: B{ a: A{ x: 4 } } };
    init() {}
}