struct SInner {
    x: Int;
    y: Bool?;
}

struct SOuter {
    i1: Int;
    innerOpt: SInner?;
    i2: Int;
}

contract TestContract {
    data: SOuter;

    init() {
        self.data = SOuter{
            i1: 10,
            innerOpt: null,
            i2: 20
        };
    }
}