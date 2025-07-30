struct SDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "def";
}

contract NestedDefaults {
    s: SDefaults;

    init() {
        self.s = SDefaults{};
    }
}
