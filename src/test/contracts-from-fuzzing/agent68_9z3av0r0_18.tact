struct SingleField {
    a: Int;
}

contract OptionalSingleStruct {
    optStruct: SingleField?;

    init() {
        self.optStruct = null;
    }
}