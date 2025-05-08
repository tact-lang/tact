struct DeepNestOpt {
    a: Int?;
    b: Bool?;
    c: InnerOpt?;
}

struct InnerOpt {
    s: String?;
    foo: Int;
}

contract NestedOptTest {
    data: DeepNestOpt;

    init() {
        self.data = DeepNestOpt {
            a: null,
            b: null,
            c: null,
        };
    }
}