struct SDefaults {
    a: Int = 0;
    b: Bool = false;
    s: String = "";
}

contract SDTest {
    x: SDefaults;

    init() {
        self.x = SDefaults{};
    }
}
