// max fieldname length stress-test
struct BigNameStruct {
    thisIsAFieldWithAnExcessivelyLongAndVerboseNameDesignedToTestTheLengthLimitsOfIdentifiersInPersistentStateVariables: Int;
}

contract Test {
    data: BigNameStruct;

    init() {
        self.data = BigNameStruct{
            thisIsAFieldWithAnExcessivelyLongAndVerboseNameDesignedToTestTheLengthLimitsOfIdentifiersInPersistentStateVariables: 42,
        };
    }
}
