struct LongStruct {
    a: Int;
    b: Bool;
    c: Int as uint8;
    d: Int as int16;
    e: Bool;
    f: Address;
    g: Bool;
    h: Int as coins;
    i: Int;
    j: Bool;
    k: Int as uint8;
    l: Int;
    m: Address;
    n: Bool;
    o: Int;
}

contract TestContract {
    s: LongStruct;

    init() {
        self.s = LongStruct{
            a: 1,
            b: false,
            c: 2,
            d: -3,
            e: true,
            f: myAddress(),
            g: false,
            h: 1000,
            i: 5,
            j: true,
            k: 255,
            l: 12345,
            m: myAddress(),
            n: false,
            o: 99999
        };
    }

    receive() {
        let _ = self.s.a + self.s.c + self.s.d + self.s.h + self.s.i + self.s.k + self.s.l + self.s.o;
        let _ = self.s.b;
        let _ = self.s.e;
        let _ = self.s.f;
        let _ = self.s.g;
        let _ = self.s.j;
        let _ = self.s.m;
        let _ = self.s.n;
    }
}