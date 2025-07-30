struct BigNest {
    a: Int;
    b: InnerBig;
}

struct InnerBig {
    x: Int;
    y: InnererBig;
}

struct InnererBig {
    p: Int;
    q: Int;
}

contract BigNestTest {
    storage: BigNest;

    init() {
        self.storage = BigNest{
            a: 1,
            b: InnerBig{
                x:2,
                y:InnererBig{p:3,q:4}
            }
        };
    }
}