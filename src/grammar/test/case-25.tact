fun function(a: Int, b: Int): Int {
    return (a >> b) || (a << (32 - b));
}

fun anotherFunction(
    a: Int,
    b: Int,
    ): Int {
    return (a >> b) || (a << (32 - b));
}

fun oneMoreFunction(
    a: Int,
    b: Int,
    c: Int,
    ): Int {
    return c + ((a >> b) || (a << (32 - b)));
}