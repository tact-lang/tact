struct HasNestedDefaults {
    val1: Int = 42;
    val2: Bool = true;
}

struct OuterDefaults {
    nested: HasNestedDefaults = HasNestedDefaults{};
}

contract ContractNestedDefaults {
    store: OuterDefaults;

    init() {
        self.store = OuterDefaults{};
    }
}