struct A {
    x: Int;
}

struct B {
    y: Int;
}

contract TestContract {
    sa: A;
    sb: B;

    init() {
        self.sa = A{ x: 11 };
        self.sb = B{ y: 22 };
    }
}
