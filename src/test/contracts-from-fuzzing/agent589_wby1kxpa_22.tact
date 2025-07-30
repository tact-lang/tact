struct SInner {
    x: Int;
}

struct SOuter {
    a: SInner?;
}

contract Test {
    v: SOuter;

    init() {
        self.v = SOuter{
            a: SInner{
                x: 7
            }
        };
    }
}