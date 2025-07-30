struct OptNest {
    inn: Int?;
}

struct WrapOpt {
    nested: OptNest?;
}

struct OuterWrap {
    wrap: WrapOpt?;
}

contract AboutNulls {
    f: OuterWrap = OuterWrap{wrap:null};
    init() {
        self.f = OuterWrap{wrap:null};
    }
}