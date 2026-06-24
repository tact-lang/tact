struct HasDefaults {
    val1: Int = 7;
    val2: Bool = true;
    val3: String = "hello";
}

contract DefaultsTest {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}