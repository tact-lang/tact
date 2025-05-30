struct InnerMost {
    v: Int;
    f: Bool;
}

struct InnerMid {
    innerMost: InnerMost;
    optionalBool: Bool?;
}

struct OuterMost {
    nested: InnerMid;
    fn: Bool;
}

contract Deep {
    data: OuterMost;
    init() {
        self.data = OuterMost{
            nested: InnerMid{innerMost: InnerMost{v:5,f:true}, optionalBool:null},
            fn: false
        };
    }
}