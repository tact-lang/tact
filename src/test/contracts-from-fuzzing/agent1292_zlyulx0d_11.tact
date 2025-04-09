struct HasDefaults {
    a: Int = 42;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultsContract {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{};
    }
}