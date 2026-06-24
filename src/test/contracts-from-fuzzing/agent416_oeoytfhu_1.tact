struct DeepInner {
    flag: Bool;
}

struct Inner {
    n: Int;
    optDeep: DeepInner?;
}

contract Test2 {
    record: Inner;

    init() {
        self.record = Inner{
            n: 42,
            optDeep: null
        };
    }
}
