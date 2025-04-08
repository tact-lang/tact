struct DeepNest {
    inner: Inner;
}

struct Inner {
    field: Int;
    optional: Bool?;
}

contract DeepTest {
    storage: DeepNest;
    init() {
        self.storage = DeepNest{
            inner: Inner{
                field: 42,
                optional: null
            }
        };
    }
}