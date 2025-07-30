struct InnerMost {
    x: Int;
}

struct InnerOpt {
    opt: InnerMost?;
}

struct Top {
    mid: InnerOpt;
}

contract OptionalDeep {
    nested: Top;
    
    init() {
        self.nested = Top{
            mid: InnerOpt{
                opt: null
            }
        };
    }
}