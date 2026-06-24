struct WithLongFieldNames {
    thisIsAVeryLongFieldNameForTesting: Int;
    anotherExcessivelyLengthyFieldIdentifierForEdgeCaseDiscovery: Bool;
}

contract LongNameFieldsTest {
    data: WithLongFieldNames;

    init() {
        self.data = WithLongFieldNames{
            thisIsAVeryLongFieldNameForTesting: 1,
            anotherExcessivelyLengthyFieldIdentifierForEdgeCaseDiscovery: false
        };
    }
}