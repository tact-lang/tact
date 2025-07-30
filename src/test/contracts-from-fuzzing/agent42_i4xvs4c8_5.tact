struct StructWithDefaults {
    a: Int = 0;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsTest {
    state: StructWithDefaults;

    init() {
        self.state = StructWithDefaults{};
    }
}