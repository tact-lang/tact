struct HasDefaults {
    a: Int = 1;
    b: String = "hi";
    c: Int?;
    d: String?;
}

contract StructWithDefaults {
    s: HasDefaults;

    init() {
        self.s = HasDefaults{};
    }
}
