struct TinyDefaults {
    x: Int = 1;
    y: Bool = false;
}

contract DefaultsTinyTest {
    s: TinyDefaults;

    init() {
        self.s = TinyDefaults{};
    }
}