struct Foo {
    a: Int;
    b: Bool;
}

contract MixParams(
    z: Int,
    foo: Foo,
    s: String?,
) {
    receive() {}
}
