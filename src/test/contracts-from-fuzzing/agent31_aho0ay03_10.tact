struct BigOptInner {
    foo: Int;
}

struct BigOptOuter {
    innerOpt: BigOptInner?;
    bar: Int;
}

contract TestContract {
    state: BigOptOuter?;

    init() {
        self.state = null;
    }
}
