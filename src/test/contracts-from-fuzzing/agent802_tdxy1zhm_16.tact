contract LongVars {
    veryLongNamedFieldNumberOne: Int = 1;
    anotherExtremelyVerboseAndLengthyVariableNameToTest: Int = 2;
    yetAnotherLongNameJustForStress: Int = 3;

    init() {
        self.veryLongNamedFieldNumberOne = 100;
        self.anotherExtremelyVerboseAndLengthyVariableNameToTest = 200;
        self.yetAnotherLongNameJustForStress = 300;
    }
}