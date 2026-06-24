struct One {
    x: Int;
}

struct Two {
    one: One;
    y: Bool;
}

struct Three {
    two: Two;
    z: String;
}

contract MultiDeepNested {
    val: Three;

    init() {
        self.val = Three{two: Two{one: One{x: 1}, y: true}, z: "deep"};
    }
}