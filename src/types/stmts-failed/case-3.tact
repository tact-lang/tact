primitive Int;
primitive Bool;

trait BaseTrait {
    
}

fun isZero(x: Int): Bool {
    do {
        x = x + 1;
    } until(x);
    return true;
}