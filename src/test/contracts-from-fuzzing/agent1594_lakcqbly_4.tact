struct OptionalNest {
    nested: Inner?;
}

struct Inner {
    num: Int;
}

contract TestOpt {
    data: OptionalNest;
    init() {
        self.data = OptionalNest{ nested: Inner{ num: 5 } };
    }
}