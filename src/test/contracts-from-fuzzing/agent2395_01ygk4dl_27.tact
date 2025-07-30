struct BigDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int? = null;
    d: String = "x";
    e: Bool = false;
}

contract BigDefaultsTest {
    store: BigDefaults;

    init() {
        self.store = BigDefaults{};
    }
}
