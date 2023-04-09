primitive Int;
primitive Bool;

trait BaseTrait {
    
}

fun f1(a: Int, b: Int): Int {
    return a + b;
}

fun f2(a: Int): Int {
    return f1(a);
}