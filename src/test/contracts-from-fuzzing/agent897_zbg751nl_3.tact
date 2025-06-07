struct Inner {
    x: Int;
    y: Bool;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    value: Int;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{ x: 10, y: false },
                flag: true
            },
            value: 99
        };
    }
}