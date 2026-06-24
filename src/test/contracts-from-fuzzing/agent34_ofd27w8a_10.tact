struct DefaultsStruct {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
}

contract ContractWithDefaultsStruct {
    stored: DefaultsStruct;

    init() {
        self.stored = DefaultsStruct{};
    }
}