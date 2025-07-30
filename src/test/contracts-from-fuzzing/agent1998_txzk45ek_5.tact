struct OptionalStruct {
    x: Int;
    y: String;
}

contract OptionalFieldStruct {
    optionalStruct: OptionalStruct?;

    init() {
        self.optionalStruct = null;
    }
}