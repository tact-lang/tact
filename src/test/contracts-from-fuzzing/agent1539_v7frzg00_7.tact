struct Middle {
    a: Int;
    opt: Inner?;
    b: Int;
}

struct Inner {
    c: Int;
    d: Bool;
}

contract OptMiddle {
    m: Middle;
    init() {
        self.m = Middle{
            a: 1,
            opt: null,
            b: 2
        };
    }
}