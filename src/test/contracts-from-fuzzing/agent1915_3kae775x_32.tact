struct NestedWithDefaults {
    a: Int = 7;
    b: String = "inner";
}

contract NestedDefaults {
    val: NestedWithDefaults;

    init() {
        self.val = NestedWithDefaults{};
    }
}