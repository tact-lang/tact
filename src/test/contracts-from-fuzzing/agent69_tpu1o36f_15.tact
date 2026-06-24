struct NestedDefaults {
    val: Int = 5;
    text: String = "hello";
}

contract NestedWithDefaults {
    nd: NestedDefaults;

    init() {
        self.nd = NestedDefaults{};
    }
}