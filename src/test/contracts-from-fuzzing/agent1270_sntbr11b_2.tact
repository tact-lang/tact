struct InnerNest {
    a: Int;
    b: Bool;
}

struct OuterNest {
    x: Int;
    y: Bool;
    inner: InnerNest;
}

contract DeepContract {
    data: OuterNest = OuterNest{
        x: 1,
        y: true,
        inner: InnerNest{
            a: 100,
            b: false,
        }
    };

    init() {
        self.data = OuterNest{
            x: 5,
            y: false,
            inner: InnerNest{
                a: 55,
                b: true,
            }
        };
    }
}