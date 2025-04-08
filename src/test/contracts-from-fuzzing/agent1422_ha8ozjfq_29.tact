struct LocalDefaults {
    m: Int = 7;
    n: Bool = true;
    s: String = "x";
}

contract LocalDefaultTest {
    d: LocalDefaults;

    init() {
        self.d = LocalDefaults{};
    }
}