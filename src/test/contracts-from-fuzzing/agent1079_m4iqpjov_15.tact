struct NestedOptional {
    nestedOpt: OptionalInner?;
}

struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

contract NestedOptTest {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{
            nestedOpt: OptionalInner{
                foo: null,
                bar: null
            }
        };
    }
}