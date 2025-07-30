// struct with many fields of different opt types
struct Combo {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "foo";
    f: String?;
    g: Address?;
    h: Cell?;
    i: Slice?;
    j: Builder?;
}

contract TestContract {
    s: Combo = Combo{};

    init() {
        self.s = Combo{
            a: 99,
            b: null,
            c: true,
            d: null,
            e: "bar",
            f: null,
            g: null,
            h: null,
            i: null,
            j: null
        };
    }

    receive() {
        let _ = self.s.a;
        let _ = self.s.b;
        let _ = self.s.c;
        let _ = self.s.d;
        let _ = self.s.e;
        let _ = self.s.f;
        let _ = self.s.g;
        let _ = self.s.h;
        let _ = self.s.i;
        let _ = self.s.j;
    }
}