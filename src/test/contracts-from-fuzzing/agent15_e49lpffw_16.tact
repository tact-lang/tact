struct InnerMost {
    f1: Int;
    f2: Bool;
}

struct Inner {
    innerMost: InnerMost;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    value: Int;
}

contract DeepNestStructs {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{
                innerMost: InnerMost{ f1: 1, f2: true },
                flag: false
            },
            value: 777
        };
    }
}