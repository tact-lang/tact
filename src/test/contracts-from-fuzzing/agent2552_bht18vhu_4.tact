struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
}

contract NestedStructStorage {
    outer: Outer = Outer{ inner: Inner{ value: 1 } };
}