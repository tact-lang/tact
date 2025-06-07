struct OptionalNest {
    a: Int?;
    b: InnerOptional?;
}

struct InnerOptional {
    c: Int?;
    d: DeeperOpt?;
}

struct DeeperOpt {
    e: Int?;
}

contract OptionalNestTest {
    nestedOpt: OptionalNest;

    init() {
        self.nestedOpt = OptionalNest{
            a: null,
            b: InnerOptional{
                c: null,
                d: DeeperOpt{ e: null }
            }
        };
    }
}