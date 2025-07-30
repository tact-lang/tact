struct OptionStruct {
    flag: Bool?;
    counter: Int?;
    addr: Address?;
}

contract OptFields {
    state: OptionStruct;

    init() {
        self.state = OptionStruct{
            flag: null,
            counter: null,
            addr: null
        };
    }
}