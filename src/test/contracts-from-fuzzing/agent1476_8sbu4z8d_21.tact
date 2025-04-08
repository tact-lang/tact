struct NestedWithDefaults {
    val: Int = 42;
    flag: Bool = true;
}

contract NestedDefaultsStorage {
    st: NestedWithDefaults;

    init() {
        self.st = NestedWithDefaults{};
    }
}