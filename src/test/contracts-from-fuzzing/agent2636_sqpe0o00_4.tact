struct OptStruct {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract ContractWithOptionals {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            opt1: null,
            opt2: true,
            opt3: null,
        };
    }
}