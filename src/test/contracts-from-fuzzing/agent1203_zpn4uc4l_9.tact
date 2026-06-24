struct One {
    x: Int;
}

struct Two {
    x: Int;
}

struct Three {
    one: One;
    two: Two;
}

contract WithMultiNested {
    data: Three;

    init() {
        self.data = Three{one: One{x:1}, two: Two{x:2}};
    }
}