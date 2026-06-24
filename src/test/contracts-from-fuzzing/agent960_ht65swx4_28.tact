struct StructWithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract DefaultsTest {
    data: StructWithDefaults;
    init() {
        self.data = StructWithDefaults{};
    }
}