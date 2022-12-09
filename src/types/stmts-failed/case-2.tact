primitive Int;
primitive Bool;

fun isZero(x: Int): Bool {
    while(x) {
        x = x + 1;
    }
    return true;
}