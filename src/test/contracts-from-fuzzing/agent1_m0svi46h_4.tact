struct Inner {
    value: Int;
}

struct Middle {
    inner: Inner;
    value: Int;
}

struct Outer {
    middle: Middle;
    value: Int;
}

contract TestNested {
    receive() {
        let o: Outer = Outer{
            middle: Middle{
                inner: Inner{ value: 42 },
                value: 10
            },
            value: 100
        };
    }
}
