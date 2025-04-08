struct S {
    x: Int = 10;
}

contract TestInit {
    s: S = S{};
    init() {
        self.s = S{x:33};
    }
    receive() {}
}