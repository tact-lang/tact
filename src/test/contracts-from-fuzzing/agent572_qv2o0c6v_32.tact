struct BigDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: String = "s";
    e: Bool = false;
    f: Address? = null;
}

contract StructWithDefaultsTest {
    s: BigDefaults;
    init() {
        self.s = BigDefaults{};
    }
}