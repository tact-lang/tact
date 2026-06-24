struct HasDefaults {
    counter: Int = 77;
    message: String = "hi";
    yes: Bool = true;
}

contract DefaultsTest {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{};
    }
}