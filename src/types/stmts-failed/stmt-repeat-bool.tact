primitive Int;
primitive Bool;

trait BaseTrait {
    
}

fun isZero(x: Int): Bool {
    repeat(true) {
        x = x + 1;
    }
    return true;
}