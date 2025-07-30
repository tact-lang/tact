struct A {
    x: Int;
}

struct B {
    y: Int;
}

contract OrderTest {
    f1: A;
    f2: Int;
    f3: B;

    init() {
        self.f1 = A{ x:1 };
        self.f2 = 2;
        self.f3 = B{ y:3 };
    }
}