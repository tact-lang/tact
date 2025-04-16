struct SmallA { x: Int }
struct SmallB { y: Int }
struct Mid {
    sA: SmallA;
    sB: SmallB;
}

struct Top {
    m: Mid;
    z: Int;
}

contract StructChain {
    data: Top;

    init() {
        self.data = Top{
            m: Mid{ sA: SmallA{x:1}, sB: SmallB{y:2} },
            z: 99
        };
    }
}
