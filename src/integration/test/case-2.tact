struct Source {
    var a: Int;
    var b: Int;
}

fun isZero(x: Int, y: Int, z: Bool, m: Source): Bool {
    m.b = 10;
    return (x + m.b) > 0 && z;
}

contract Empty {
    
}