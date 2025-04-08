struct DeepNested {
    a: Int;
    b: Inner;
}

struct Inner {
    c: Int;
    d: InnerMost;
}

struct InnerMost {
    e: Int;
    f: Bool;
}

contract DeepContract {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            a: 10,
            b: Inner{
                c: 20,
                d: InnerMost{e: 30, f: true}
            }
        };
    }
}
