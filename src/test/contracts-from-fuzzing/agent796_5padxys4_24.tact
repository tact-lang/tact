struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int?;
}

contract Test {
    d: ManyDefaults;
    init() {
        self.d = ManyDefaults{};
    }
}