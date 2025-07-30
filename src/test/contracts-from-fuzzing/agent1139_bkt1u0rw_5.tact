struct OptionalInStruct {
    val: Int?;
}

contract TopLevelOptStruct {
    optionalStruct: OptionalInStruct;

    init() {
        self.optionalStruct = OptionalInStruct{
            val: null
        };
    }
}