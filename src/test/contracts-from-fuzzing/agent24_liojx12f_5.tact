struct Inner {
    foo: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract Test {
    outer: Outer = Outer{
        middle: Middle{
            inner: Inner{
                foo: 123
            }
        }
    };

    init() {}
}