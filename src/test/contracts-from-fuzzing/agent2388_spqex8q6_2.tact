struct DeepNest {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestDeep {
    nested: DeepNest;

    init() {
        self.nested = DeepNest{
            inner: Inner{x: 10, y: false},
            flag: true
        };
    }
}