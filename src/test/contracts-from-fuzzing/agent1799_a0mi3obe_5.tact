struct InnerStruct {
    a: Int;
    b: Bool;
    c: String?;
}

struct MiddleStruct {
    inner: InnerStruct;
    optInner: InnerStruct?;
}

struct OuterStruct {
    middle: MiddleStruct;
    maybeMiddle: MiddleStruct?;
}

contract NestedOptionals {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            middle: MiddleStruct{
                inner: InnerStruct{a:1,b:true,c:null},
                optInner: null
            },
            maybeMiddle: null
        };
    }
}
