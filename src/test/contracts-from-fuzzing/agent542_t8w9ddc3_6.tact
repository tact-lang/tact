struct OptStruct {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract ContractWithOptionals {
    state: OptStruct;

    init() {
        self.state = OptStruct{
            x: null,
            y: null,
            s: null
        };
    }
}