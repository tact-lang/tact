struct S {
    b: Bool = true;
    s: String = "hey";
}

contract PrimitivesDefaults {
    a: Int = 0;
    inner: S = S{};

    init() {
        self.a = 42;
        self.inner = S{};
    }

    receive() {
        self.a += 1;
    }
}