struct WeirdDefaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "abc";
}

contract WeirdDefaultsTest {
    s: WeirdDefaults;

    init() {
        self.s = WeirdDefaults{};
    }
}
