struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct Layered {
    inner1: InnerOpt;
    inner2: InnerOpt;
}

contract DoubleLayeredOpt {
    storage: Layered;

    init() {
        self.storage = Layered{
            inner1: InnerOpt{ x: null, y: true },
            inner2: InnerOpt{ x: 55, y: null },
        };
    }
}