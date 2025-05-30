struct InnerStruct {
    a: Int;
    b: Bool;
}

struct MiddleStruct {
    inner: InnerStruct;
}

struct OuterStruct {
    middle: MiddleStruct;
}

contract Test {
    out: OuterStruct = OuterStruct{
        middle: MiddleStruct{
            inner: InnerStruct{
                a: 10,
                b: true,
            },
        },
    };

    init() {}
}