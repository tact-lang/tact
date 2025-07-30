struct Inner {
    flag: Bool;
}

struct Outer {
    inner: Inner;
    count: Int;
}

contract NestedStruct {
    data: Outer = Outer{
        inner: Inner{ flag: true },
        count: 42
    };
}