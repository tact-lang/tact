primitive Int;
primitive Bool;

trait BaseTrait {
    
}

fun isZero(x: Int, y: Int, z: Bool): Bool {
    let b: Int = x + y;
    b = b + 1;
    return b > 0 || z;
}