struct TupleReturn { a: Int; b: Int }

fun earlyLoopReturn(): Int {
    repeat (10) {
        if (true) {
            return 999;
        }
    }
    return 0;
}

fun nestedBlockReturn(x: Int): Int {
    {
        if (x == 0) {
            return 100;
        }
    }
    return x;
}

fun conditionalReturn(x: Int): Int {
    if (x > 0) {
        return x;
    } else {
        return -x;
    }
}

fun main() {
    dump(earlyLoopReturn());        // Expected: 999
    dump(nestedBlockReturn(0));       // Expected: 100
    dump(nestedBlockReturn(5));       // Expected: 5
    dump(conditionalReturn(3));       // Expected: 3
    dump(conditionalReturn(-7));      // Expected: 7
}
