struct Inner {
    a: Int;
    b: Int?;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    num: Int;
}

contract NestedContract {
    state: Outer;

    init() {
        self.state = Outer{
            middle: Middle{
                inner: Inner{ a: 7, b: null },
                flag: true
            },
            num: 99
        };
    }
}