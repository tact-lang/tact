struct InnerMult {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Bool;
}

contract ManyStructs {
    f1: InnerMult;
    f2: InnerMult;
    f3: InnerMult;

    init() {
        self.f1 = InnerMult{x1:1,x2:2,x3:3,x4:true};
        self.f2 = InnerMult{x1:4,x2:5,x3:6,x4:false};
        self.f3 = InnerMult{x1:7,x2:8,x3:9,x4:true};
    }
}
