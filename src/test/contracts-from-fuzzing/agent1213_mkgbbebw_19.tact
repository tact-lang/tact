struct OptInner {
    a: Int?;
    b: Int?;
    c: Int?;
}

struct OptMid {
    x: OptInner?;
    y: OptInner?;
}

contract NestedMidOpt {
    f: OptMid;
    
    init() {
        self.f = OptMid{ x:null, y:null };
    }
}