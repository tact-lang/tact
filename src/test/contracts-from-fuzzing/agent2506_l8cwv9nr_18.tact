struct ComplexDefaults {
    optNum: Int? = null;
    txt: String = "default";
    flag: Bool = true;
}

contract ContractComplexDefaults {
    field: ComplexDefaults;
    init() {
        self.field = ComplexDefaults{};
    }
}
