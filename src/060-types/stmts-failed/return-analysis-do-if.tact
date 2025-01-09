primitive Int;
primitive Bool;

fun notAlwaysReachableReturn(b: Bool): Int {
    do {
        if (b) {return 42;}
    } until (!b);
}
