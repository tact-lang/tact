struct Inner {
    flag: Bool;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    optInner: Inner?;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            inner1: Inner{flag: true},
            inner2: Inner{flag: false},
            optInner: null,
        };
    }
}
