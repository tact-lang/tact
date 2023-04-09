primitive Int;
primitive Bool;

trait BaseTrait {
    
}

fun isZero(x: Int): Bool {
    if (x) {
        x = x + 1;
    }
    return true;
}