struct Vec2 {
    x: Int;
    y: Int;
}

contract ParamTest(
    foo: Int,
    bar: Bool,
    baz: String,
    optI: Int?,
    optB: Bool?,
    vec: Vec2
) {
    receive() {}
}