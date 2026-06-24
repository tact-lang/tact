struct NestedWithDefaults {
    x: Int = 5;
    y: Int? = null;
}

contract StructInContractDefaults {
    d: NestedWithDefaults;
    init() {
        self.d = NestedWithDefaults{};
    }
}