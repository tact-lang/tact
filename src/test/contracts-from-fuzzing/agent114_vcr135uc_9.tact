contract LongFieldNames {
    thisIsAVeryLongNameForAFieldToTestLimit1: Int;
    anotherExtremelyVerboseAndLengthyNameForPersistenceVariable2: String;
    theThirdFieldIsAlsoUnusuallyLongAndVerboseForEdgeCaseTest3: Bool?;

    init() {
        self.thisIsAVeryLongNameForAFieldToTestLimit1 = 99;
        self.anotherExtremelyVerboseAndLengthyNameForPersistenceVariable2 = "hello";
        self.theThirdFieldIsAlsoUnusuallyLongAndVerboseForEdgeCaseTest3 = null;
    }
}
