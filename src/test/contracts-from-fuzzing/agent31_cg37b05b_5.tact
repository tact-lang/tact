struct StructWithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "test";
}

contract DefaultsTest {
    data: StructWithDefaults;

    init() {
        self.data = StructWithDefaults{};
    }
}