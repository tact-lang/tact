struct OptDeep {
    f: Int?;
    nested: InnerOptDeep?;
}

struct InnerOptDeep {
    g: Bool?;
    h: Int;
}

contract OptDeepNest {
    s: OptDeep;
    init() {
        self.s = OptDeep{
            f:null,
            nested: InnerOptDeep{ g:null, h:42 }
        };
    }
}