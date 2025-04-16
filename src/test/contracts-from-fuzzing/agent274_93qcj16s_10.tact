struct Inner {
    a: Int;
}

struct Middle {
    inner: Inner;
    optInner: Inner?;
}

struct Outer {
    middle: Middle;
    count: Int;
    flag: Bool;
}

contract NestedMixed {
    payload: Outer;

    init() {
        self.payload = Outer{
            middle: Middle{
                inner: Inner{a: 1},
                optInner: null
            },
            count: 123,
            flag: true,
        };
    }
}