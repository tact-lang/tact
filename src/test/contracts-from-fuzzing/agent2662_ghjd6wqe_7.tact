struct Inner {
    f: Int;
}

struct Middle {
    inner: Inner;
}

contract NestedDefaults {
    state: Middle;

    init() {
        self.state = Middle{
            inner: Inner{f: 10},
        };
    }
}