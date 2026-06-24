struct A {
    a: Int;
}

struct B {
    b: Int;
}

contract OrderTest {
    f1: A;
    f2: B;
    init() {
        self.f1 = A{a:1};
        self.f2 = B{b:2};
    }
}