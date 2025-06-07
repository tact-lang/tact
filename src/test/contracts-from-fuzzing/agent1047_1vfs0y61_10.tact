struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: NestedOpt?;
}

struct NestedOpt {
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Test {
    store: OptionalNest;

    init() {
        self.store = OptionalNest{
            a: null,
            b: null,
            c: null
        };
    }
}