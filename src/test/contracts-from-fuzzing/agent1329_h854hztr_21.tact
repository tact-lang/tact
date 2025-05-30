struct One {
    a: Int;
}
struct Two {
    b: One;
}
struct Three {
    c: Two;
}
struct Four {
    d: Three;
}
struct Five {
    e: Four;
}

contract NestedFive {
    val: Five;

    init() {
        self.val = Five{ e: Four{ d: Three{ c: Two{ b: One{ a: 1 } } } } };
    }
}