struct OptStruct {
    optA: Int?;
    optB: Int?;
}

contract OptFields {
    field1: OptStruct;

    init() {
        self.field1 = OptStruct{ optA: null, optB: 123 };
    }
}