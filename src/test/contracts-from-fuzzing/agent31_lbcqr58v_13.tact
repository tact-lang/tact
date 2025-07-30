struct A {
    x: Int;
}

struct B {
    y: Int?;
}

struct C {
    z: Int;
}

contract Test {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{ x: 1 };
        self.b = B{ y: null };
        self.c = C{ z: 2 };
    }
}