struct InnerMost {
    val: Int;
}

struct Inner {
    opt: InnerMost?;
    cond: Bool;
}

struct Outer {
    nested: Inner;
    tag: Int;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            nested: Inner{
                opt: null,
                cond: true,
            },
            tag: 999
        };
    }
}
