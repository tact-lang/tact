struct OptionStruct {
    optionalVal: Int?;
    optionalFlag: Bool?;
}

contract OptionalStructFields {
    data: OptionStruct = OptionStruct{optionalVal: null, optionalFlag: true};
    receive() {
        let _ = self.data.optionalFlag;
    }
}