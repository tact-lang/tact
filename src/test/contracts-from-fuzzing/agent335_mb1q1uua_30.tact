struct InnerStruct {
    a: Int;
    b: Bool;
}

struct MiddleStruct {
    inner1: InnerStruct;
    inner2: InnerStruct;
}

struct OuterStruct {
    middle: MiddleStruct;
    x: Int;
}

contract DeeplyNestedStructs {
    data: OuterStruct;

    init() {
        self.data = OuterStruct {
            middle: MiddleStruct {
                inner1: InnerStruct{a:1,b:true},
                inner2: InnerStruct{a:2,b:false}
            },
            x: 5
        };
    }
}