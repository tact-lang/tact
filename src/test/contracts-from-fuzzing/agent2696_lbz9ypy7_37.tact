struct A {
    x: Int;
}

contract SetInInit {
    f: A;
    init() {
        self.f = A{x:0};
    }
}