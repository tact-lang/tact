struct InnerStruct {
    s1: Int;
}

struct MiddleStruct {
    inner: InnerStruct;
    optionalInner: InnerStruct?;
}

struct OuterStruct {
    middle: MiddleStruct;
    optionalMiddle: MiddleStruct?;
}

contract NestedOptionals {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            middle: MiddleStruct{
                inner: InnerStruct{ s1: 1 },
                optionalInner: null
            },
            optionalMiddle: null
        };
    }
}