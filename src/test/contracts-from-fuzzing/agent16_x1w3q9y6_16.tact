fun f(x: Int): Int {
    return x;
}

// Overload not allowed, so we try with a different function name to simulate
fun g(x: Bool): Int {
    return x ? 1 : 0;
}

fun main(): Int {
    let a: Int = f(10);
    let b: Int = g(true);
    dump(a);
    dump(b);
    return a + b; // Expected: 10 + 1 = 11
}
