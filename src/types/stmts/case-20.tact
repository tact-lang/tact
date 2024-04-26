primitive Int;
primitive Bool;

fun notAlwaysReachableReturn(b: Bool): Int {
    if b {
        try {
            let x: Int = 1 / (b ? 0 : 1);
            return 42;
        } catch(e) {
            return 43;
        }
    } else {
        do {
            return 44;
        } until (!b);
    }
}
