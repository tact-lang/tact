struct S {
    a: Int;
}

contract ProvideInitField {
    s: S;
    init() {
        self.s = S{a:41};
    }
}