struct MidS {
    a: Int;
    b: Bool?;
}

struct OuterS {
    m1: MidS;
    m2: MidS;
    b1: Bool;
    b2: Bool?;
}

contract MultiMidOut {
    f: OuterS;
    init() {
        self.f = OuterS{
            m1: MidS{a:11, b:null},
            m2: MidS{a:22, b:true},
            b1: false,
            b2: null,
        };
    }
}