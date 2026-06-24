struct InnerStruct {
    s: String = "default";
}

contract ContractDefaults {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{};
    }
}