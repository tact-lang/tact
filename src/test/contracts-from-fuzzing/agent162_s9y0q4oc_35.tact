struct DoubleNest {
    first: InnerOne;
    second: InnerTwo;
}

struct InnerOne {
    foo: Int;
    bar: String;
}

struct InnerTwo {
    baz: Int?;
    qux: Bool;
}

contract Nesting {
    field: DoubleNest;

    init() {
        self.field = DoubleNest{
            first: InnerOne{foo: 1, bar: "bar"},
            second: InnerTwo{baz: null, qux: false}
        };
    }
}