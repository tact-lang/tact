struct DefaultVals {
    a: Int = 42;
    b: Bool = true;
    c: Int?;
}

contract WithDefaults {
    s: DefaultVals;

    init() {
        self.s = DefaultVals{};
    }
}