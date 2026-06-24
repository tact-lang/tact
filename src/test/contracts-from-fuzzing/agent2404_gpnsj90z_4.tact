struct InnerMost {
    value: Int;
}

struct Inner {
    nestedOpt: InnerMost?;
    flag: Bool;
}

struct Outer {
    a: Int;
    b: Inner;
}

contract TestContract {
    storage: Outer;
    init() {
        self.storage = Outer{
            a: 7,
            b: Inner{
                nestedOpt: InnerMost{value: 42},
                flag: false
            }
        };
    }
}