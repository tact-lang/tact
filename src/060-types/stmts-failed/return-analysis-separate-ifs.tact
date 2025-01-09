primitive Int;
primitive Bool;

fun notAlwaysReachableReturn(b: Bool): Int {
    if (b) {
        return 42;
    }
    if (!b) {
        return 43;
    }
    // This is actually a fine program,
    // but our return-reachability analysis is too imprecise
    // to understand it
    // ERROR: no return statement
}
