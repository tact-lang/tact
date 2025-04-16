struct InnerA {
    a1: Int;
    a2: Bool;
}

struct InnerB {
    b1: String;
    b2: Bool?;
}

struct MiddleLevel {
    ia: InnerA;
    ib: InnerB;
    middleInt: Int as uint32;
}

contract MultiNest {
    inner: MiddleLevel;

    init() {
        self.inner = MiddleLevel{
            ia: InnerA{a1:10,a2:true},
            ib: InnerB{b1: "data", b2: null},
            middleInt: 100
        };
    }
}