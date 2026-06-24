struct LongNames {
    someVeryLongFieldNameThatCouldCauseIssues: Int;
    anotherExtremelyLengthyFieldIdentifierToTestEdgeCases: String;
}

contract LongFieldNames {
    field: LongNames;

    init() {
        self.field = LongNames{
            someVeryLongFieldNameThatCouldCauseIssues: 7,
            anotherExtremelyLengthyFieldIdentifierToTestEdgeCases: "ok"
        };
    }
}
