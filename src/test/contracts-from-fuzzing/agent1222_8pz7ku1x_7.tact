struct Wide {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Int = 6;
    g: Int = 7;
    h: Int = 8;
    i: Int = 9;
    j: Int = 10;
}

contract TestContract {
    w: Wide;

    init() {
        self.w = Wide{
            a: 101,
            f: 106,
            j: 110,
            // other fields default
        };
    }

    receive() {
        let sum = self.w.a + self.w.b + self.w.c + self.w.d + self.w.e + self.w.f + self.w.g + self.w.h + self.w.i + self.w.j;
    }
}