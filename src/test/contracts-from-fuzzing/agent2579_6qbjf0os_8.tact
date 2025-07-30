struct InnerMost {
    foo: Int;
}

struct Inner {
    bar: InnerMost?;
}

struct OuterOpt {
    baz: Inner?;
}

contract NestedOptTest {
    val: OuterOpt;
    init() {
        self.val = OuterOpt{
            baz: null,
        };
    }
}