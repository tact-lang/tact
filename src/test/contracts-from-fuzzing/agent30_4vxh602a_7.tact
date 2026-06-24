struct OptionStruct {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
}

contract HasOptionStruct {
    optStruct: OptionStruct;
    
    init() {
        self.optStruct = OptionStruct{
            optInt: null,
            optBool: null,
            optAddress: null
        };
    }
}