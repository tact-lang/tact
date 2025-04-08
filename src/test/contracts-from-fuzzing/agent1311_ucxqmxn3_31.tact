struct BigInner {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
}

struct Outer {
    innerOpt: BigInner?;
}

contract NestedOptionalExtreme {
    state: Outer?;

    init() {
        self.state = null;
    }
}
