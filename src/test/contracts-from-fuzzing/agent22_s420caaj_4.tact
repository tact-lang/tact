struct LongStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
}

fun compute_long(ls: LongStruct): Int {
    return ls.a + ls.b + ls.c + ls.d + ls.e + ls.f + ls.g + ls.h + ls.i + ls.j;
}

contract TestFlatStruct {
    receive() {
        let ls: LongStruct = LongStruct{ a: 1, b: 1, c: 1, d: 1, e: 1, f: 1, g: 1, h: 1, i: 1, j: 1 };
        compute_long(ls);
    }
}
