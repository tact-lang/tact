struct NestedStructDefaults {
    a: Int = 1;
    b: String = "b";
}

contract WrappedNestedWithDefaults {
    nested: NestedStructDefaults;

    init() {
        self.nested = NestedStructDefaults{};
    }
}