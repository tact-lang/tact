struct NestBool {
    b1: Bool;
    b2: Bool?;
}

struct OuterNest {
    nb: NestBool;
    b3: Bool;
}

contract NestedBoolOpts {
    data: OuterNest;
    init() {
        self.data = OuterNest{
            nb: NestBool{
                b1: true,
                b2: null
            },
            b3: false
        };
    }
}