struct SWithDefaults {
    x: Int = 5;
    y: Bool = false;
    z: String = "str";
}

contract Test {
    s: SWithDefaults;
    init() {
        self.s = SWithDefaults{};
    }
}
