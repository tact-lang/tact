struct DefaultOptStruct {
    a: Int? = null;
    b: Bool? = null;
}

contract ContractWithDefaults {
    s: DefaultOptStruct;

    init() {
        self.s = DefaultOptStruct{};
    }
}