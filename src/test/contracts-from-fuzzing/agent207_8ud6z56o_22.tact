struct Inner {
    x: Int;
}

struct Outer {
    y: Int = 777;
    inner: Inner;
}

contract TestContract {
    s: Outer = Outer{
        inner: Inner{ x: 5 },
    };
}