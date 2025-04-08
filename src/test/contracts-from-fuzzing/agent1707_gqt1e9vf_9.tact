struct NestedOptional {
    optionalField: Int?;
    boolField: Bool;
}

struct MidStruct {
    first: NestedOptional?;
    second: Int;
}

contract OptionalInside {
    data: MidStruct;

    init() {
        self.data = MidStruct{
            first: null,
            second: 99
        };
    }
}