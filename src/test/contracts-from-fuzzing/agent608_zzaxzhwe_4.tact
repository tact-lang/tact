struct InnerMost {
    d: Int;
}

struct Mid {
    c: InnerMost;
    b: Int;
}

struct Top {
    a: Mid;
}

contract Test {
    data: Top = Top{a: Mid{c: InnerMost{d: 1}, b: 2}};
}
