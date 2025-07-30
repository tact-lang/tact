struct Inner {
    intValue: Int;
    boolValue: Bool;
}

struct Outer {
    innerStruct: Inner;
    optionalString: String?;
}

contract TestNestedFields {
    field: Outer;

    init() {
        self.field = Outer{
            innerStruct: Inner{
                intValue: 42,
                boolValue: true
            },
            optionalString: null
        };
    }
}
