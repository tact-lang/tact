struct Inner {
    value: Int;
}

struct Outer {
    innerA: Inner;
    innerB: Inner;
}

contract TestContract {
    data: Outer = Outer{
        innerA: Inner{ value: 42 },
        innerB: Inner{ value: -7 }
    };
}