contract TestDeepNested {
    nested: OuterStruct;

    init() {
        self.nested = OuterStruct{
            middle: MiddleStruct{
                inner: InnerStruct{
                    val: 321,
                    flag: true,
                },
                optionalInner: null,
            },
            maybeMiddle: null,
        };
    }
}

struct InnerStruct {
    val: Int as uint32;
    flag: Bool;
}

struct MiddleStruct {
    inner: InnerStruct;
    optionalInner: InnerStruct?;
}

struct OuterStruct {
    middle: MiddleStruct;
    maybeMiddle: MiddleStruct?;
}
