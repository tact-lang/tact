primitive Int;
primitive Bool;

fun notAlwaysReachableReturn(b: Bool): Int {
    try {
        return 42;
    }
}
