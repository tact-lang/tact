struct IntBool { i: Int; b: Bool }

fun retTuple(x: Int): IntBool {
    return IntBool { i: x, b: x > 0 };
}

fun retOptional(x: Int): Int? {
    if (x % 2 == 0) {
        return x;
    } else {
        return null;
    }
}

fun nestedLoopReturn(x: Int): Int {
    // simulate nested blocks inside a recursive call
    if (x > 5) {
        { if (x == 10) { return 100; } }
    }
    return x;
}
