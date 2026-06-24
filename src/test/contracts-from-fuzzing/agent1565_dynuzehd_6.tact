struct DeepOpt {
    inner: Inner?;
}

struct Inner {
    nested: Nested?;
}

struct Nested {
    value: Int;
}

contract DeepOptTest {
    val: DeepOpt;

    init() {
        self.val = DeepOpt{
            inner: Inner{
                nested: Nested{
                    value: 123,
                },
            },
        };
    }
}