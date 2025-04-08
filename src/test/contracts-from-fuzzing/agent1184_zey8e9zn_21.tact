struct InnerStruct {
    foo: Int;
    bar: Bool;
}

struct MiddleStruct {
    v: Int;
    inner: InnerStruct;
}

struct OuterStruct {
    middle: MiddleStruct;
    text: String;
}

contract TripleNested {
    payload: OuterStruct;

    init() {
        self.payload = OuterStruct{
            middle: MiddleStruct{
                v: 45,
                inner: InnerStruct{
                    foo: 12,
                    bar: false
                }
            },
            text: "triple"
        };
    }
}