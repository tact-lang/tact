struct NestedDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
}

contract ContractWithDefaultNested {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{};
    }
}
