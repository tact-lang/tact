struct S {
    a: Int;
}

contract InitDefault {
    x: S;

    init() {
        self.x = S{a: 42};
    }
}