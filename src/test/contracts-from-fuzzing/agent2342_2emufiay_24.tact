struct StructWithDefaults {
    foo: Int = 5;
    bar: String = "default";
    flag: Bool = true;
}

contract ContractWithDefaults {
    data: StructWithDefaults;

    init() {
        self.data = StructWithDefaults{};
    }
}