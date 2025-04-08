struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "test";
}

contract StructWithDefaults {
    s: HasDefaults;
    init() {
        self.s = HasDefaults{};
    }
}