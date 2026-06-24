struct OptionalStruct {
    field1: Int;
    field2: Int;
}

contract OptionalsInPersistent {
    optionalStructField: OptionalStruct?;

    init() {
        self.optionalStructField = null;
    }
}