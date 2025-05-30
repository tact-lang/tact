struct SWithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract StructDefaults {
    s: SWithDefaults;

    init() {
        self.s = SWithDefaults{};
    }
}