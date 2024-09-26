primitive Int;
primitive Bool;

trait BaseTrait {
    
}

fun test(): Int {
    let x: Int = 42;
    x += true;
    return x;
}