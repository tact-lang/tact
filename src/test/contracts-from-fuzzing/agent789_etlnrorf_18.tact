struct HasDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "def";
}

contract DefaultsInNestedStructs {
    val: HasDefaults;
    init() {
        self.val = HasDefaults{};
    }
}