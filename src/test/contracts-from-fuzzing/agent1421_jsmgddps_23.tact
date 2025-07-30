struct S {
    a: Int;
}
contract InitDefaults {
    s: S;
    init() {
        self.s = S{a: 1138};
    }
}