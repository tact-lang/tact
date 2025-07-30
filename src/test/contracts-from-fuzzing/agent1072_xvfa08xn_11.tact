struct S {
    x: Int?;
    y: Bool?;
}

contract OptionalDefaults {
    s: S;
    init() {
        self.s = S{};
    }
}