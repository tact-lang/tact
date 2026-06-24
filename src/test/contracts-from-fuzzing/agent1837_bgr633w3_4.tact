struct OptionalNestedStruct {
    optionalInner: InnerStruct?;  // optional nested struct
}

struct InnerStruct {
    val: Int;
}

contract OptionalNestedFieldContract {
    testField: OptionalNestedStruct;

    init() {
        self.testField = OptionalNestedStruct{
            optionalInner: InnerStruct{ val: 5 }
        };
    }
}