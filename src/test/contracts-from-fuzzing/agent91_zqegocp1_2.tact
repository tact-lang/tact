struct DeepNested {
    inner: InnerOpt;
}

struct InnerOpt {
    val: Int?;
    next: Inner?;
}

struct Inner {
    a: Int;
    b: Int;
}

contract Test {
    field: DeepNested;

    init() {
        self.field = DeepNested{
            inner: InnerOpt{
                val: null,
                next: null,
            },
        };
    }
}