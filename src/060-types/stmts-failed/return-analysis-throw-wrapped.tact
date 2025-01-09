primitive Int;
primitive Bool;

@name(throw)
native throw(code: Int);

// This demonstrates that we don't do inter-procedural analysis
// to determine a function always throws,
// but we might do it in the future, then this negative
// test will be moved to the set of positive tests.
fun throwWrapped(code: Int) {
    throw(code);
}

fun notAlwaysReachableReturn(b: Bool): Int {
    throwWrapped(42);
}
