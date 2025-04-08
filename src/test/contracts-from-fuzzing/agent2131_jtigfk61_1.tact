struct DeepInner {
    a: Int;
    b: Bool;
}

struct OuterNest {
    optInner: DeepInner?;
    flag: Bool;
}

contract NestOptTest {
    nested: OuterNest;

    init() {
        self.nested = OuterNest{
            optInner: null,
            flag: true,
        };
    }
}