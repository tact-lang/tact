struct MixNested {
    intField: Int;
    boolField: Bool;
    innerStruct: Inner;
}

struct Inner {
    optInt: Int?;
    str: String;
}

contract MixNestedStructs {
    field: MixNested;

    init() {
        self.field = MixNested{
            intField: 101,
            boolField: false,
            innerStruct: Inner{
                optInt: null,
                str: "nested"
            }
        };
    }
}
