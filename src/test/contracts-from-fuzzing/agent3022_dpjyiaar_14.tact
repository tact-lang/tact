struct InnerMost { k: Int; }
struct MidOpt {
    a: Int?;
    b: InnerMost?;
}

struct OuterOpt {
    mid: MidOpt?;
    mval: Int;
}

contract DeepOptional {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            mid: MidOpt{a:null,b:InnerMost{k:5}},
            mval: 100
        };
    }
}
