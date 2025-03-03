primitive Int;

fun min_int(a: Int, b: Int): Int {
    if (a <= b) {
        return a;
    } else {
        return b;
    }
}

fun factorial(a: Int): Int {
    if (a < 0) {
        return 0;  // Dummy number for invalid input
    }

    if (a <= 1) {
        return 1;
    } else {
        return a * factorial(a - 1);
    }
}


fun test() {
    let a: Int = 3;
    let b: Int = factorial(a);    // 6
    let zero: Int = 0;
    a /= min_int(factorial(b), zero);    // Division by zero
}