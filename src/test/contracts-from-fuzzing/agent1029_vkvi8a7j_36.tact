struct VariousDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
    d: Slice? = null;
    e: Int? = null;
    f: Bool? = null;
}

contract DefaultsTest {
    s: VariousDefaults;
    init() {
        self.s = VariousDefaults{};
    }
}