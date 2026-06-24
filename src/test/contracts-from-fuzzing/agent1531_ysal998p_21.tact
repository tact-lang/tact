struct A {
    a: Int;
}

contract UseA {
    data: A;

    init() {
        self.data = A{a:0};
    }
}

struct B {
    b: Int;
}

contract UseB {
    data: B;

    init() {
        self.data = B{b:0};
    }
}
