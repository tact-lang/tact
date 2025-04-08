struct InnerStruct {
    x: Int;
    y: Int;
}

struct MiddleStruct {
    inner: InnerStruct;
}

struct OuterStruct {
    middle: MiddleStruct;
    extra: Int?;
}

contract DeepFields {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            middle: MiddleStruct{
                inner: InnerStruct{
                    x: 10,
                    y: 20,
                },
            },
            extra: null,
        };
    }
}