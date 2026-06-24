struct S {
    f: Int? = null;
}

contract PersistentStructDefault {
    s: S = S{};

    init() {
        self.s = S{};
    }
}
