primitive Int;
primitive Bool;

@name(throw)
native throw(code: Int);

fun notAlwaysReachableReturn(b: Bool): Int {
    try {
        throw(42);
    }
}
