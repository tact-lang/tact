contract HugeStruct {
    s: S;

    init() {
        self.s = S{
            a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7, i: 8, j: 9,
            k: 10, l: 11, m: 12, n: 13, o: 14, p: 15, q: 16, r: 17, s: 18, t: 19,
            u: 20, v: 21, w: 22, x: 23, y: 24, z: 25
        };
    }
}

struct S {
    a: Int; b: Int; c: Int; d: Int; e: Int; f: Int;
    g: Int; h: Int; i: Int; j: Int; k: Int; l: Int;
    m: Int; n: Int; o: Int; p: Int; q: Int; r: Int;
    s: Int; t: Int; u: Int; v: Int; w: Int; x: Int;
    y: Int; z: Int;
}
