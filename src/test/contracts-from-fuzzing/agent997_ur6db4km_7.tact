struct Inner {
    z: Int?;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    outer: Outer = Outer{
        inner: Inner{z: null}
    };
}