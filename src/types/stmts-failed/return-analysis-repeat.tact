primitive Int;
primitive Bool;

fun notAlwaysReachableReturn(n: Int): Int {
    repeat (n) {
        return 42;
    }
}
