struct SOptDefault {
    a: Int = 42;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
    e: String?;
}

contract OptDefaults {
    s: SOptDefault;

    init() {
        self.s = SOptDefault{d: null, e: null};
    }
}
