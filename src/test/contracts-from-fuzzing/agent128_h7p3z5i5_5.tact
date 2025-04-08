struct Deep {
    inner: Inner;
}

struct Inner {
    core: Core;
}

struct Core {
    val: Int;
    opt: Bool?;
}

contract TripleNested {
    s: Deep;

    init() {
        self.s = Deep{ inner: Inner{ core: Core{ val: 42, opt: null } } };
    }
}