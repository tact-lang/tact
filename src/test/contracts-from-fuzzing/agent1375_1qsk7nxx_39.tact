struct StructOptDefaults {
    a: Int? = null;
    b: String? = null;
}

contract ContractOptDefaults {
    nested: StructOptDefaults;

    init() {
        self.nested = StructOptDefaults{};
    }
}