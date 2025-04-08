struct NestedOptionals {
    o1: Int?;
    o2: Bool?;
    inner: InnerOpt;
}

struct InnerOpt {
    a: String?;
    b: Address?;
}

contract NestedOptTest {
    s: NestedOptionals;

    init() {
        self.s = NestedOptionals{
            o1: null,
            o2: null,
            inner: InnerOpt{ a: null, b: null }
        };
    }
}
