struct OptNest {
    field1: Int?;
    field2: String?;
    field3: Bool?;
}

contract ContractWithOptStruct {
    data: OptNest;

    init() {
        self.data = OptNest{
            field1: 42,
            field2: null,
            field3: true,
        };
    }
}
