struct AllDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "default";
    d: Int?;
}

contract DefaultsTest {
    s: AllDefaults;

    init() {
        self.s = AllDefaults{};
    }
}
