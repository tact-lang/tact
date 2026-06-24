struct OptionalNest {
    f1: Int?;
    f2: Inner?;
}

struct Inner {
    x: Int;
    y: Int?;
}

contract TestOptNest {
    v: OptionalNest;

    init() {
        self.v = OptionalNest{
            f1: null,
            f2: null,
        };
    }
}