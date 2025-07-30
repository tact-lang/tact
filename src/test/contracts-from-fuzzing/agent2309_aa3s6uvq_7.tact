struct OptOuter {
    inner: Inner?;
}

struct Inner {
    value: Int;
}

contract OptNested2 {
    state: OptOuter;

    init() {
        self.state = OptOuter{ inner: null };
    }
}