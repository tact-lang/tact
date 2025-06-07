struct DeepOptional {
    a: Int?;
    b: Bool?;
    c: InnerOptional?;
}

struct InnerOptional {
    d: Int;
    e: Bool;
}

contract NestedOptTest {
    nested: DeepOptional;

    init() {
        self.nested = DeepOptional{
            a: null,
            b: true,
            c: InnerOptional{
                d: 42,
                e: false
            }
        };
    }

    receive() {}
}