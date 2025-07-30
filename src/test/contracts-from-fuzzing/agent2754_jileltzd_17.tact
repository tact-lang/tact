struct ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Address? = null;
}

contract DefaultsTest {
    field: ZeroDefaults;

    init() {
        self.field = ZeroDefaults{};
    }
}
