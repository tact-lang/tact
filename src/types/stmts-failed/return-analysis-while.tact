primitive Int;
primitive Bool;

fun notAlwaysReachableReturn(b: Bool): Int {
    while (b) {
        try {
            return 42;
        } catch(e) {
            return 43;
        }
    }
}
