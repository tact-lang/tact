fun function(a: Int, b: Int): Int {
    return (a >> b) || (a << (32 - b));
}

fun anotherFunction(
    a: Int,
    b: Int,
    ): Int {
    return (a >> b) || (a << (32 - b));
}

fun coverage(a: Int, b: Int) {
    let c: Int = anotherFunction(
        a,
        b,
    );
}

fun oneMoreFunction(
    a: Int,
    b: Int,
    ): Int {
    return anotherFunction(
        a,
        b,
    );
}