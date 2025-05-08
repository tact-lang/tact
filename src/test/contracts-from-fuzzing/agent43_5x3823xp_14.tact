struct S {
    a: Int?;
}
contract OptDefaults {
    f: S?;

    init() {
        self.f = null;
    }
}
