struct InnerStruct {
    x: Int;
    y: String?;
}

struct MiddleStruct {
    inner1: InnerStruct;
    inner2: InnerStruct;
}

struct OuterStruct {
    middle: MiddleStruct;
    flag: Bool?;
}

contract NestedLayers {
    field: OuterStruct;

    init() {
        self.field = OuterStruct{
            middle: MiddleStruct{
                inner1: InnerStruct{ x: 5, y: "hi" },
                inner2: InnerStruct{ x: 6, y: null },
            },
            flag: true,
        };
    }
}