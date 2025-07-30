struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool;
}

contract OptNestTest {
    store: OptionalNest;

    init() {
        self.store = OptionalNest{
            a: null,
            b: null,
            c: null,
        };
    }
}