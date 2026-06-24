struct MultiOptional {
    a: Int?;
    b: Bool? = true;
    c: String?;
    d: Bool? = false;
}

contract OptionalDefaultsCombo {
    s: MultiOptional;

    init() {
        self.s = MultiOptional{};
    }
}