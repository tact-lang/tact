struct Inner {
    n: Int = 7 * 6;
}

contract ExprDef {
    f: Inner;

    init() {
        self.f = Inner{};
    }

    receive() {}
}