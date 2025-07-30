struct BigNest {
    val: Int;
    optInner: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

contract BigOptionalNest {
    x: BigNest;

    init() {
        self.x = BigNest{
            val: 7,
            optInner: Inner{
                a: 5,
                b: true,
                c: null
            }
        };
    }
}