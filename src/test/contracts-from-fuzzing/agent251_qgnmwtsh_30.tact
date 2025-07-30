struct One {
    a: Int;
}

struct Two {
    one: One;
}

struct Three {
    two: Two;
}

contract OptionalMultiNested {
    data: Three?;

    init() {
        self.data = null;
    }
}