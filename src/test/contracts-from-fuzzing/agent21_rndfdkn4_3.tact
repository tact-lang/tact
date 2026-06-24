struct TestNestedOpt {
    field1: Int;
    optField: Bool?;
    nested: InnerNest?;
}

struct InnerNest {
    s: String;
    n: Int?;
}

contract OptionalNest {
    data: TestNestedOpt;

    init() {
        self.data = TestNestedOpt{
            field1: 123,
            optField: null,
            nested: InnerNest{
                s: "text",
                n: null,
            },
        };
    }
}
