primitive Int;
primitive Bool;

fun notAlwaysReachableReturn(b: Bool): Int {
    try {
        return 42;
    } catch(e) {
        if (b) {return 43;}
    }
}
