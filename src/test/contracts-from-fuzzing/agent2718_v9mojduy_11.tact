struct InnerMost {
    i: Int;
    b: Bool;
}

struct Middle {
    inner: InnerMost;
    flag: Bool;
}

struct OuterMost {
    mid: Middle;
    msg: String;
}

contract TripleNest {
    data: OuterMost = OuterMost{
        mid: Middle{
            inner: InnerMost{ i: 1, b: true },
            flag: false
        },
        msg: "deep"
    };
}