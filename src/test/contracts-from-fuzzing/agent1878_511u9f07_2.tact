struct Inner {
    optInt: Int?;
}

struct Outer {
    nested: Inner;
}

contract Test {
    state: Outer;

    init() {
        self.state = Outer{ nested: Inner{ optInt: null } };
    }
}