struct Nested {
    inner: InnerStruct;
    maybeInner: InnerStruct?;
}

struct InnerStruct {
    intVal: Int;
    strVal: String;
    flag: Bool;
    maybeInt: Int?;
}

contract DeepStructTester {
    nestedField: Nested;
    optionalNested: Nested?;
    
    init() {
        self.nestedField = Nested{
            inner: InnerStruct{
                intVal: 1,
                strVal: "abc",
                flag: true,
                maybeInt: null,
            },
            maybeInner: null,
        };
        self.optionalNested = null;
    }
}