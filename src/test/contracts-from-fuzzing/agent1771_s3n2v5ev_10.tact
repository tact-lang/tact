contract LongFieldNames {
    thisIsAField: Int;
    anotherVeryLongFieldNameForTesting: Bool;
    yetAnotherExtremelyLengthyFieldIdentifier: String;
    superDuperMegaLongVariableNameToCheck: Address;

    init() {
        self.thisIsAField = 1;
        self.anotherVeryLongFieldNameForTesting = true;
        self.yetAnotherExtremelyLengthyFieldIdentifier = "abc";
        self.superDuperMegaLongVariableNameToCheck = myAddress();
    }
}