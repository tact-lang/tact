struct NestedStruct {
    s1: String;
    optInt: Int?;
}

struct MiddleStruct {
    inner: NestedStruct;
    flag: Bool;
}

contract DeepAndWide {
    a: MiddleStruct;
    b: MiddleStruct;

    init() {
        self.a = MiddleStruct{
            inner: NestedStruct{ s1: "X", optInt: null },
            flag: true
        };
        self.b = MiddleStruct{
            inner: NestedStruct{ s1: "Y", optInt: 42 },
            flag: false
        };
    }
}