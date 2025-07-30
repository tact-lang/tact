struct Level {
    deepNestedValue: Int;
}

contract LongNames {
    someExtremelyLongFieldNameThatIsNestedInsideAnotherStruct: Level;

    init() {
        self.someExtremelyLongFieldNameThatIsNestedInsideAnotherStruct = Level{
            deepNestedValue: 55
        };
    }
}
