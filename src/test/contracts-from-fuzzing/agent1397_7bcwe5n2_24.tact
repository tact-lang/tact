struct Complex {
    a: Int?;
    b: Bool;
    c: Bool?;
    d: Address;
    e: Address?;
    f: Int as uint32;
    g: Int as int64;
}

contract TestContract {
    c: Complex;

    init() {
        self.c = Complex{
            a: null,
            b: true,
            c: null,
            d: myAddress(),
            e: null,
            f: 10,
            g: 22,
        };
    }

    receive() {
        let _ = self.c.a;
        let _ = self.c.b;
        let _ = self.c.c;
        let _ = self.c.d;
        let _ = self.c.e;
        let _ = self.c.f;
        let _ = self.c.g;
    }
}