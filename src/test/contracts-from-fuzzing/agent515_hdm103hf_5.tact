struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: Inner;
    v: Int?;
}

struct Outer {
    middle: Middle;
    x: Int;
    flag: Bool;
}

contract TestNestOpt {
    data: Outer?;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{a: 5, b: true},
                v: null
            },
            x: 10,
            flag: false
        };
    }
}
