struct InnerMost {
    foo: Int;
}

struct InnerOpt2 {
    bar: InnerMost?;
}

struct OuterOpt {
    baz: InnerOpt2?;
}

contract OptOptTest {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            baz: null
        };
    }
}
