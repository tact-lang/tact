struct One {
    num: Int;
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

contract Test10 {
    deep: Five;

    init() {
        self.deep = Five{four: Four{three: Three{two: Two{one: One{num:123}}}}};
    }
}