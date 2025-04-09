struct InnerStruct {
    x: Int;
    y: String;
    z: Bool?;
}

struct MiddleStruct {
    inner1: InnerStruct;
    inner2: InnerStruct;
    flag: Bool;
}

contract ComplexNestedData {
    field: MiddleStruct;

    init() {
        self.field = MiddleStruct{
            inner1: InnerStruct{ x:1, y: "a", z: null },
            inner2: InnerStruct{ x:2, y: "b", z: true },
            flag: false,
        };
    }
}