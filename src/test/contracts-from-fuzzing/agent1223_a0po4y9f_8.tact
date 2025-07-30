struct BigNestedStruct {
    a: Int;
    b: Bool;
    c: String?;
    d: InnerStruct;
}

struct InnerStruct {
    x: Int?;
    y: Bool;
    z: String;
}

contract BigNestedStructStore {
    compound: BigNestedStruct;
    init() {
        self.compound = BigNestedStruct{
            a: 1,
            b: false,
            c: null,
            d: InnerStruct{ x: null, y: true, z: "test" }
        };
    }
}