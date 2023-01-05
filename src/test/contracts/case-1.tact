struct Source {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

fun isZero(x: Int, y: Int, z: Bool, m: Source): Bool {
    let b: Int = x + y;
    b = b + 1 + m.a + m.b;
    return b > 0 && z;
}

contract Empty {

    x: Int;   

    init() {
        self.x = 0;
    }
}