struct Inner {
    z: Int;
}
struct Outer {
    x: Int;
    inner: Inner;
}

contract TestContract {
    outer: Outer = Outer{x: 5, inner: Inner{z: 20}};
}