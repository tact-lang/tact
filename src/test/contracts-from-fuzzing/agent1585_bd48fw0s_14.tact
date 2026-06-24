struct SInner {
    x: Int;
    y: Int;
}

struct SOuter {
    a: SInner;
    b: SInner;
}

struct STop {
    s: SOuter;
}

contract StructChain {
    d: STop;

    init() {
        self.d = STop{
            s: SOuter{
                a: SInner{ x:1, y:2 },
                b: SInner{ x:3, y:4 }
            }
        };
    }
}