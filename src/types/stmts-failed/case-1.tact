primitive Int;
primitive Bool;

fun isZero(x: Int): Bool {
    repeat(true) {
        x = x + 1;
    }
    return true;
}