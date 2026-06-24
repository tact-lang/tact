struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestNestedGetter {
    receive() {}

    get fun getOuter(): Outer {
        return Outer{
            inner: Inner{ x: 10 },
            flag: true
        };
    }
}
