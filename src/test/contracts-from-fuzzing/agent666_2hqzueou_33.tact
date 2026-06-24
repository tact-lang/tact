struct S {
    val: Int = 0;
}

contract InitDefault {
    s: S;

    init() {
        self.s = S{};
    }
}