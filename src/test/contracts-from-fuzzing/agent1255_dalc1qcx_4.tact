struct DefaultValues {
    a: Int = 1;
    b: Bool = false;
    c: Int = 100;
    d: Bool = true;
}

contract TestDefaults {
    f: DefaultValues;
    init() {
        self.f = DefaultValues{};
    }
}