struct S {
    value: Int? = null;
}

contract OptionalDefault {
    s: S;

    init() {
        self.s = S{};
    }
}