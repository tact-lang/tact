struct Source {
    var a: Int;
    var b: Int;
    var c: Int;
    var d: Int;
}

fun isZero(x: Int, y: Int, z: Bool, m: Source): Bool {
    let b: Int = x + y;
    b = b + 1 + m.a + m.b;
    return b > 0 && z;
}