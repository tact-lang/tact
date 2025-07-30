struct Inner {
    v: Int;
}

struct Middle {
    i1: Inner;
    opt: Inner?;
    flag: Bool;
}

contract NestedOption {
    m: Middle;
    init() {
        self.m = Middle{
            i1: Inner{v:1},
            opt: null,
            flag: false
        };
    }
}
