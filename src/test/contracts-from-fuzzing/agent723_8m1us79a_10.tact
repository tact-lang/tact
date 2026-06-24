struct Inner {
    foo: Bool;
    bar: Int;
}

contract TestContract(
    d1: Int,
    d2: Inner,
) {
    receive() {}
}