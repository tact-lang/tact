struct OptionalNestedDefaulted {
    val: Int? = null;
    flag: Bool? = null;
}

contract ContractOptionalDefaulted {
    data: OptionalNestedDefaulted = OptionalNestedDefaulted{};

    init() {
        self.data = OptionalNestedDefaulted{ val: 7, flag: true };
    }
}