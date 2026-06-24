struct StructWithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
}

contract DefaultsStructTest {
    s: StructWithDefaults;

    init() {
        self.s = StructWithDefaults{};
    }
}