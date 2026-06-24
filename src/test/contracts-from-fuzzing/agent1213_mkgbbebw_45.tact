struct PrimitiveDefaults {
    a: Int = 7;
    b: Bool = false;
    c: String = "abc";
}

contract PrimitiveDefaultsTest {
    s: PrimitiveDefaults;

    init() {
        self.s = PrimitiveDefaults{};
    }
}