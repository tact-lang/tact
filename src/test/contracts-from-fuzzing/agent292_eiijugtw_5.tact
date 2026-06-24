struct Inner {
    p: Int;
}

struct Middle {
    inner: Inner;
    q: Int as uint32;
}

struct Outer {
    middle: Middle;
    flag: Bool;
}

contract NestedSerialization {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{inner: Inner{p: 12}, q: 34},
            flag: true,
        };
    }
}