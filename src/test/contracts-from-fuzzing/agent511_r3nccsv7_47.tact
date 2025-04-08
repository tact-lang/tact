struct MultiDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "s";
}

contract MultiDefaultsTest {
    s: MultiDefaults;

    init() {
        self.s = MultiDefaults{};
    }
}