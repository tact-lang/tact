struct InnerStruct {
    content: Int;
    optionalVal: Int?;
}

struct OuterStruct {
    intField: Int;
    boolField: Bool;
    nested: InnerStruct;
}

contract TestContract {
    storage: OuterStruct;
    init() {
        self.storage = OuterStruct{
            intField: 5,
            boolField: true,
            nested: InnerStruct{
                content: 42,
                optionalVal: null
            }
        };
    }
}
