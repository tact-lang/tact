struct S {
    n: Int?;
}

contract OptionalUninitialized {
    var: S;
    init() {
        self.var = S{};
    }
}
