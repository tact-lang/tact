struct Simple {
    a: Int;
}

contract Parameters(
    foo: Int,
    bar: Simple,
    buzz: Int?,
    boo: Simple?,
) {
    receive() {
        // do nothing
    }
}