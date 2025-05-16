struct OptionalStruct {
    optInner: Inner?;
}

struct Inner {
    val: Bool;
}

struct TopLevel {
    nestedOpt: OptionalStruct;
}

contract OptionalChain {
    top: TopLevel;

    init() {
        self.top = TopLevel{ nestedOpt: OptionalStruct{ optInner:null } };
    }
}