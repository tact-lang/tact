struct Mid {
    nestedVal: Int;
    optBool: Bool?;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract DoubleNested {
    field: Top;

    init() {
        self.field = Top{
            m1: Mid{nestedVal:11,optBool:true},
            m2: Mid{nestedVal:22,optBool:null}
        };
    }
}