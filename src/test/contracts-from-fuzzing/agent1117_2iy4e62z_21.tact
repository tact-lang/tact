struct OptStringStruct {
    s: String?;
}

contract ContractOptString {
    data: OptStringStruct;

    init() {
        self.data = OptStringStruct {
            s: null
        };
    }
}
