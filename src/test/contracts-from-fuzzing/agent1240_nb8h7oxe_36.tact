struct IntsOpt {
    a: Int?;
    b: Int?;
    c: Int?;
}

struct WrapOpt {
    nested: IntsOpt;
}

contract WrappedOptionalInts {
    w: WrapOpt;
    init() {
        self.w = WrapOpt{
            nested: IntsOpt{ a:null, b:null, c:null }
        };
    }
}