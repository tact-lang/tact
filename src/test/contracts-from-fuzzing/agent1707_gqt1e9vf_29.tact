struct LargeDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
    d: Int? = null;
    e: Bool? = null;
}

contract DefaultsTest {
    data: LargeDefaults;

    init() {
        self.data = LargeDefaults{};
    }
}