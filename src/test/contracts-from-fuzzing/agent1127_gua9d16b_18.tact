struct P {
    x: Int as int64;
    y: Int as int64;
}
struct Q {
    p1: P;
    p2: P;
}

contract DupStructs {
    rec: Q;

    init() {
        self.rec = Q{
            p1: P{ x:1, y:1 },
            p2: P{ x:2, y:2 }
        };
    }
}