struct WithinWithin {
    a: Int;
    b: Bool;
}

struct Within {
    nested: WithinWithin;
    c: String?;
}

contract OptionalNested {
    s: Within?;

    init() {
        self.s = null;
    }

    receive() {}
}