struct Inner {
    z: Int;
}

struct Outer {
    x: Int;
    inner: Inner?;
}

contract TestContract {
    outer: Outer = Outer{
        x: 42,
        inner: Inner{z: 100}
    };
}