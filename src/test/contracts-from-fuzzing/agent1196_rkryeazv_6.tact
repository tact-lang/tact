struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    a: InnerOpt?;
    b: String?;
}

contract OptionalNestTest {
    foo: OuterOpt;

    init() {
        self.foo = OuterOpt{
            a: null,
            b: null,
        };
    }
}
