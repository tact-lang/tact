primitive Int;
primitive Bool;

trait BaseTrait {
    
}

fun test(x: Int): Int {
    x &&= true;
    return x;
}