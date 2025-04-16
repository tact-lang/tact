struct LongerFieldNames {
    thisIsALongStructFieldNameDesignedToTestCompilerHandling: Int;
}

contract LongStructNameField {
    s: LongerFieldNames;

    init() {
        self.s = LongerFieldNames{
            thisIsALongStructFieldNameDesignedToTestCompilerHandling: 12345
        };
    }
}
