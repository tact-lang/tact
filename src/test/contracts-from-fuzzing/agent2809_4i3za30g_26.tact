struct NestedWithDefaults {
    inner: Int = 17;
}

contract StorageDefaultNested {
    val: NestedWithDefaults;

    init() {
        self.val = NestedWithDefaults{};
    }
}