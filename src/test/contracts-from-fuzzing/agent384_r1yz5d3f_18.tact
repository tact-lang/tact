contract LongFieldNames {
    thisIsAReallyLongFieldNameButStillShouldWork: Int;
    anotherLongNameToTestLimitsOfFieldIdentifiers: Bool;

    init() {
        self.thisIsAReallyLongFieldNameButStillShouldWork = 1;
        self.anotherLongNameToTestLimitsOfFieldIdentifiers = true;
    }
}