struct NestedDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "hi";
}

contract StructDefaults {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{};
    }
}
