struct Inner {
    foo: Int;
    bar: Bool;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    num: Int;
    cond: Bool;
}

contract NestedThreeLevel {
    state: Outer;

    init() {
        self.state = Outer{
            mid: Middle{
                inner: Inner{ foo: 1, bar: false },
                flag: true
            },
            num: 99,
            cond: false
        };
    }
}