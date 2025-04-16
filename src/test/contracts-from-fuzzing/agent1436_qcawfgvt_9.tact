struct LongNames {
    thisIsALongFieldNameForTestingPurposes: Int;
    anotherUnnecessarilyVerboseFieldIdentifier: Bool;
}

contract TestContract {
    data: LongNames;

    init() {
        self.data = LongNames{
            thisIsALongFieldNameForTestingPurposes: 123,
            anotherUnnecessarilyVerboseFieldIdentifier: true,
        };
    }
}
