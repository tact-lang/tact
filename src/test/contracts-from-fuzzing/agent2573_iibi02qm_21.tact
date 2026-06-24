struct DefaultsTest {
    num: Int? = null;
    flag: Bool? = null;
    txt: String = "hello";
    enabled: Bool = true;
}

contract StructWithDefaults {
    config: DefaultsTest;

    init() {
        self.config = DefaultsTest{};
    }
}