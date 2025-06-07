struct WeirdDefaults {
    x: Int = 0;
    y: Bool? = null;
    s: String = "test";
}

contract WeirdDefaultsTest {
    val: WeirdDefaults;
    init() {
        self.val = WeirdDefaults{};
    }
}