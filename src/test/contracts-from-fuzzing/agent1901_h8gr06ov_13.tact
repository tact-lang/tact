struct LongNameStruct {
    thisIsAnExcessivelyLongFieldNameDesignedToTestCompilerLimitsForIdentifierLength: Int = 42;
}

contract LongFieldContract {
    state: LongNameStruct;

    init() {
        self.state = LongNameStruct{};
    }
}