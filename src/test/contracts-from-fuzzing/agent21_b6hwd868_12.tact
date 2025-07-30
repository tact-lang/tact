struct Inner {
    x: Int;
    y: Int;
}

struct Middle {
    value: Int;
    inner: Inner?;
}

struct Outer {
    m: Middle;
}

contract TestContract {
    big: Outer;

    init() {
        self.big = Outer{
            m: Middle{
                value: 7,
                inner: null
            }
        };
    }
}