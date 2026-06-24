struct DefaultsTest {
    x: Int = 7;
    y: String = "hi";
    b: Bool?;
    label: String?;
}

contract StructDefaults {
    st: DefaultsTest;

    init() {
        self.st = DefaultsTest{};
    }
}