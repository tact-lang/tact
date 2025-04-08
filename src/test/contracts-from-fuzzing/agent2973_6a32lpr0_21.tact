struct InnerStruct {
    f1: Int;
    f2: Bool;
}

struct MiddleStruct {
    inner: InnerStruct;
}

struct OuterStruct {
    middle: MiddleStruct;
}

contract ManyLayers {
    field: OuterStruct;

    init() {
        self.field = OuterStruct{
            middle: MiddleStruct{
                inner: InnerStruct{
                    f1: 9,
                    f2: true
                }
            }
        };
    }
}