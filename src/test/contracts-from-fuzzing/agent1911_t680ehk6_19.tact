struct DoubleNestedOpt {
    x: Int?;
    node: InnerOne?;
}

struct InnerOne {
    value: Int?;
}

contract OptOptTest {
    ref: DoubleNestedOpt;

    init() {
        self.ref = DoubleNestedOpt{
            x: null,
            node: null
        };
    }
}