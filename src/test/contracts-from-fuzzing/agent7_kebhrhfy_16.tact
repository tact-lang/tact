struct HasDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsTest {
    val: HasDefaults;
    init() {
        self.val = HasDefaults{};
    }
}