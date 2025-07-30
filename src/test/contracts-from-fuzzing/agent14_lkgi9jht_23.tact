struct One {
    x: Int;
}
struct Two {
    one: One;
}
struct Three {
    two: Two;
}
struct Four {
    three: Three;
}
struct Five {
    four: Four;
}

contract TestContract {
    lvl: Five;

    init() {
        self.lvl = Five{ four: Four{ three: Three{ two: Two{ one: One{ x: 5 } } } } };
    }
}