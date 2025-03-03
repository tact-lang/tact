primitive Int;

fun test(v: Int): Int {
    let n: Int = 1;
    let exponent: Int = 255;

    if (n != 0) {
        exponent += 1;      // Assignment always executes because condition is true, so exponent = 256
    } else {
        exponent -= 1;      // Assignment ignored.
    }

    return n << exponent;      // Overflow reported: 1 * 2^256
}