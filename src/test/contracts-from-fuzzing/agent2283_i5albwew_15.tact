struct ComposeOnceMore {
    opt: Int?;
    optStr: String?;
    str: String;
    b: Bool;
}

struct ComposeOuter {
    nested1: ComposeOnceMore;
    nested2: ComposeOnceMore;
}

contract ComposeOuterContract {
    composed: ComposeOuter;

    init() {
        self.composed = ComposeOuter{
            nested1: ComposeOnceMore{opt:null,optStr:null,str:"s1",b:true},
            nested2: ComposeOnceMore{opt:null,optStr:null,str:"s2",b:false}
        };
    }
}
