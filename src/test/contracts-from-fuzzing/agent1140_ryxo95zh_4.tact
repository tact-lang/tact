struct InnerNested {
    val: Int;
    flag: Bool;
}

struct OuterNested {
    nested1: InnerNested;
    nested2: InnerNested;
    flagOuter: Bool;
    optInner: InnerNested?;
}

contract DoubleNested {
    storage: OuterNested;
    init() {
        self.storage = OuterNested{
            nested1: InnerNested{ val:1, flag:true },
            nested2: InnerNested{ val:2, flag:false },
            flagOuter: true,
            optInner: null
        };
    }
}