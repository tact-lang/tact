struct struct_decl_0 {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

fun function_def_1(x: Int, y: Int, z: Bool, m: Source): Bool {
    let b: Int = x + y;
    b = b + 1 + m.a + m.b;
    let c: Int = y >> 123;
    let d: Int = x << 10;
    return b > 0 && z && c == 0 && d == 0;
}

contract contract_2 {
    init() {}

    get fun function_def_3(x: Int, y: Int, z: Bool, m: Source): Bool {
        return isZero(x, y, z, m);
    }
}
