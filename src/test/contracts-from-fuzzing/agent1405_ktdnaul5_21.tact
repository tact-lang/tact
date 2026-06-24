struct DefaultsTest {
    a: Int = 1;
    b: Bool = true;
    s: String = "default";
}

contract StructWithDefaults {
    state: DefaultsTest;

    init() {
        self.state = DefaultsTest{};
    }
}