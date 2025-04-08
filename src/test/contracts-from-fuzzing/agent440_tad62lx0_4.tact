struct InnerMost {
    val: Int;
}

struct Inner {
    nested: InnerMost;
    state: Bool;
}

struct Outer {
    inner: Inner;
    active: Bool;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Inner{
                nested: InnerMost{
                    val: 123
                },
                state: true
            },
            active: false
        };
    }
}