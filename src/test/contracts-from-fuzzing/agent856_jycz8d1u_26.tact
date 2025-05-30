contract LongNames {
    thisIsAReallyLongNameFieldForTestingEdgeCases: Int;
    anotherExcessivelyVerboseNamedVariableHereForTesting: Bool;
    yetOneMoreSuperLongFieldNameToSeeHowWellItsAllHandled: String;

    init() {
        self.thisIsAReallyLongNameFieldForTestingEdgeCases = 1;
        self.anotherExcessivelyVerboseNamedVariableHereForTesting = true;
        self.yetOneMoreSuperLongFieldNameToSeeHowWellItsAllHandled = "x";
    }
}