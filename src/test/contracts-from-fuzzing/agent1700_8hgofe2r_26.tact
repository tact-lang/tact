struct OptionStruct {
    oo: Int?;
    pp: String?;
    qq: Address?;
}

contract TestContract {
    s: OptionStruct;

    init() {
        self.s = OptionStruct{
            oo: null,
            pp: null,
            qq: null
        };
    }
}