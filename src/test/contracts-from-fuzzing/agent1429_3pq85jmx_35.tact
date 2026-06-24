struct A {
    x: Int;
}

struct B {
    y: Int;
}

contract Test {
    a: A = A{ x: 1 };
    b: B = B{ y: 2 };

    init() {
        self.a = A{ x: 10 };
        self.b = B{ y: 20 };
    }
}