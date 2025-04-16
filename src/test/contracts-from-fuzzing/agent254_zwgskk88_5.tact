struct Inner {
    x: Int;
}
struct Outer {
    y: Int;
    z: Inner?;
}
contract TestContract {
    nested: Outer?;
    receive() {}
}