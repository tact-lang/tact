struct MiddleOpt {
    x: Int?;
    y: Int?;
}

struct OuterOpt {
    m1: MiddleOpt;
    m2: MiddleOpt;
}

contract Test {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            m1: MiddleOpt{ x:null, y:null },
            m2: MiddleOpt{ x:null, y:null },
        };
    }
}