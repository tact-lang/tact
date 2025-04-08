struct OptionalNest {
    a: Int?;
    b: Sub1?;
}

struct Sub1 {
    x: Int?;
    y: Sub2?;
}

struct Sub2 {
    z: Int?;
}

contract NestedOpts {
    nested: OptionalNest;

    init() {
        self.nested = OptionalNest{
            a: null,
            b: Sub1{
                x: null,
                y: Sub2{
                    z: null
                }
            }
        };
    }
}
