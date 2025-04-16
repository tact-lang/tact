struct NestedDefaults {
    foo: Int = 42;
    bar: Bool = true;
}

contract NestedStructDefaults {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{};
    }
}