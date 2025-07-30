struct A {
    f: Int;
}

struct B {
    f: Int;
}

contract Test {
    a: A;
    b: B;

    init() {
        self.a = A{ f: 1 };
        self.b = B{ f: 2 };
    }
}
