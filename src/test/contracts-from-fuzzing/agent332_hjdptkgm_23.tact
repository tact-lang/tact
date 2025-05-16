contract NestedTupleLike {
    a: Int;
    rest: Rest;

    init() {
        self.a = 1;
        self.rest = Rest{b:2, c: Wrap{d:3, e:false}};
    }
}

struct Rest {
    b: Int;
    c: Wrap;
}

struct Wrap {
    d: Int;
    e: Bool;
}