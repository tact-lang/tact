struct Flat {
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
    k: Int;
}

contract TestFlat {
    receive() {
        let x: Flat = Flat { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8, i: 9, j: 10, k: 11 };
        let s = x.a + x.b + x.c + x.d + x.e + x.f + x.g + x.h + x.i + x.j + x.k;
        s;
    }
}
