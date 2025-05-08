struct InnerMost {
    foo: Int;
}

struct MiddleLevel {
    inner: InnerMost;
}

struct OuterLevel {
    middle: MiddleLevel;
    opt: InnerMost?;
}

contract NestedOptionalTest {
    dataField: OuterLevel;

    init() {
        self.dataField = OuterLevel{
            middle: MiddleLevel{
                inner: InnerMost{foo: 1}
            },
            opt: null,
        };
    }
}
