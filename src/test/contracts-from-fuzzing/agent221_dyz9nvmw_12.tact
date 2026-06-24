struct Inner {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Int; g: Int; h: Int; i: Int; j: Int;
}

contract LongParams(
    x: Int,
    y: Inner,
    z: Int,
    w: Inner
) {
    receive() {
        // dummy to compile
    }
}