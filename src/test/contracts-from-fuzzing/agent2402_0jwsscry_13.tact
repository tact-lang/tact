contract LongFieldNames {
    thisIsAReallyLongFieldNameToTestTheCompilerEdgeCaseWithUnusualNames: Int;
    anotherSuperLongFieldNameJustForGoodMeasure1234567890: Bool;

    init() {
        self.thisIsAReallyLongFieldNameToTestTheCompilerEdgeCaseWithUnusualNames = 111;
        self.anotherSuperLongFieldNameJustForGoodMeasure1234567890 = true;
    }
}