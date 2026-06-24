struct NestedOpt {
    innerOpt: InnerOpt;
}

struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

contract NestedOptTest {
    x: NestedOpt;

    init() {
        self.x = NestedOpt{
            innerOpt: InnerOpt{
                foo: null,
                bar: null,
            },
        };
    }
}