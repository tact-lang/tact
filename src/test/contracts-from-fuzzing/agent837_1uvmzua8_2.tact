struct InnerStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
}

struct OuterStruct {
    inner: InnerStruct;
    x: Int;
    y: Bool?;
}

contract NestedComplex {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            inner: InnerStruct{
                a: 1,
                b: null,
                c: false,
                d: "test",
            },
            x: 42,
            y: true,
        };
    }
}