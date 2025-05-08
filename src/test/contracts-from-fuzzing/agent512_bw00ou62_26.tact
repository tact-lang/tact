struct EmptyStringDefaults {
    first: String = "";
}

contract EmptyStringDefaultsTest {
    data: EmptyStringDefaults;

    init() {
        self.data = EmptyStringDefaults{};
    }
}