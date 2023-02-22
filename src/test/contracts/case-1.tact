struct Source {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

fun isZero(x: Int, y: Int, z: Bool, m: Source): Bool {
    let b: Int = x + y;
    b = b + 1 + m.a + m.b;
    let c: Int = (y >> 123);
    let d: Int = (x << 10);
    return b > 0 && z && c == 0 && d == 0;
}

contract Empty {

    init() {
    }

    get fun a(x: Int, y: Int, z: Bool, m: Source): Bool {
        return isZero(x, y, z, m);
    }
}