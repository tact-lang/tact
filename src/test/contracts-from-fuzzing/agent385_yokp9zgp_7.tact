struct LongFieldNames {
    veryLongFieldNameOne: Int;
    anotherExceedinglyVerboseField: Bool;
}

contract LongNameFields {
    data: LongFieldNames;

    init() {
        self.data = LongFieldNames{
            veryLongFieldNameOne: 5,
            anotherExceedinglyVerboseField: false
        };
    }
}