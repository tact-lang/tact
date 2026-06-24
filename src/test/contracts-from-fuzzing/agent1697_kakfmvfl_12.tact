struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    x: Int;
    inner: Inner;
}

struct Outer {
    m: Middle;
    y: Int;
}

contract MixedDeep {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{x: 7, inner: Inner{a: 1, b: false}},
            y: 9
        };
    }
}