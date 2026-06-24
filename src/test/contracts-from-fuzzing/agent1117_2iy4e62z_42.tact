struct MultiDefaults {
    a: Int = 1;
    b: String = "hello";
    c: Bool = true;
}

contract HasMultiDefaults {
    s: MultiDefaults;

    init() {
        self.s = MultiDefaults{};
    }
}
