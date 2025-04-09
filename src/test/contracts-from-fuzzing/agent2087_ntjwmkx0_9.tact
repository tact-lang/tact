struct InnerNested {
    f1: Int;
    f2: String;
    f3: Bool;
}

struct Middle {
    mval: InnerNested;
    optionalInner: InnerNested?;
}

struct OuterMost {
    first: Middle;
    second: Middle;
}

contract DeepOptionals {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            first: Middle{mval: InnerNested{f1:1,f2:"a",f3:true}, optionalInner: null},
            second: Middle{mval: InnerNested{f1:2,f2:"b",f3:false}, optionalInner: null}
        };
    }
}