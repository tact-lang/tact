struct Deep {
    i1: Int;
    s1: Inner;
    opt: Outer?;
}

struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    p: Int;
    q: Inner;
}

contract Test {
    dep: Deep;

    init() {
        self.dep = Deep{
            i1: 5,
            s1: Inner{x: 1, y: null},
            opt: null,
        };
    }
}