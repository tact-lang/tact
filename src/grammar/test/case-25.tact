fun function(a: Int, b: Int): Int {
    return (a >> b) || (a << (32 - b));
}

fun anotherFunction(
    a: Int,
    b: Int,
    ): Int {
    return (a >> b) || (a << (32 - b));
}