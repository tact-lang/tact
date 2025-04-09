struct A {
    n: Int;
}

struct B {
    m: Int;
}

contract MultiStructContract {
    sa: A;
    sb: B;

    init() {
        self.sa = A{ n: 99 };
        self.sb = B{ m: 101 };
    }
}