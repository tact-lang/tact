struct InnerOpt {
    foo: Int?;
}

struct OuterOpt {
    nested: InnerOpt?;
    num: Int;
}

contract NestedOptionalFieldContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nested: InnerOpt{ foo: 55 },
            num: 99,
        };
    }
}