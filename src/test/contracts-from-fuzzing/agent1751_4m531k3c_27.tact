struct Complex {
    foo: Int;
    bar: Bool;
}

contract MixedParams(
    val1: Int,
    val2: Bool?,
    conf: Complex,
    optConf: Complex?
) {
    receive() {}
}