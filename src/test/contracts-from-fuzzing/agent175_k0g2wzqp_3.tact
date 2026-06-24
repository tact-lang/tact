struct S {
    x: Int; y: Int; z: Int; a: Int; b: Int; c: Int; d: Int; e: Int; f: Int; g: Int;
    h: Int; i: Int; j: Int; k: Int; l: Int; m: Int; n: Int; o: Int; p: Int; q: Int;
}

contract ManyFields {
    s: S;

    init() {
        self.s = S{
            x: 1, y: 2, z: 3, a: 4, b: 5, c: 6, d: 7, e: 8, f: 9, g: 10,
            h: 11, i: 12, j: 13, k: 14, l: 15, m: 16, n: 17, o: 18, p: 19, q: 20,
        };
    }
}