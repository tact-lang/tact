primitive Int;
primitive Bool;

fun isZero(x: Int): Bool {
    do {
        x = x + 1;
    } until(x);
    return true;
}