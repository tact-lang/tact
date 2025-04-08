struct Inner {
    a: Int as uint32;
    b: Int as int64;
    c: Bool;
}

struct Outer {
    f: Inner;
    d: Int;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{
            f: Inner{ a: 5, b: -1000, c: true },
            d: 7
        };
    }

    receive() {
        let _ = self.o.f.a;
        let _ = self.o.f.b;
        let _ = self.o.f.c;
        let _ = self.o.d;
    }
}