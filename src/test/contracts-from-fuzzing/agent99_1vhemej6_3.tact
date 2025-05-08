struct Pair { first: Int; second: Int }

fun earlyReturn(a: Int): Int {
    if (a > 0) {
        return a;
    }
    return -a;
}

fun loopReturn(): Int {
    repeat (3) {
        if (false) {
            return 99;
        }
    }
    return 0;
}

fun optionalReturn(a: Int): Int? {
    if (a > 0) {
        return a;
    } else {
        return null;
    }
}

fun conditionalReturn(a: Int): Int {
    if (a == 0) {
        return 0;
    } else if (a > 0) {
        return a;
    } else {
        return -a;
    }
}

fun getPair(a: Int, b: Int): Pair {
    return Pair{ first: a, second: b };
}

fun main() {
    dump(earlyReturn(10));      // expected 10
    dump(earlyReturn(-5));      // expected 5
    dump(loopReturn());         // expected 0
    dump(optionalReturn(12));   // expected 12
    dump(optionalReturn(-3));   // expected null
    dump(conditionalReturn(-7)); // expected 7
    let p = getPair(3,4);
    dump(p.first + p.second);   // expected 7
}
