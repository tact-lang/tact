struct HasNiceDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultsTest {
    field: HasNiceDefaults;

    init() {
        self.field = HasNiceDefaults{};
    }
}