// Struct containing various primitive options
struct ManyOpts {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
    bu: Builder?;
}

contract TestContract {
    m: ManyOpts = ManyOpts{};

    init() {
        self.m = ManyOpts{
            i: null,
            b: null,
            s: null,
            a: null,
            c: null,
            sl: null,
            bu: null
        };
    }

    receive() {
        let _ = self.m.i;
        let _ = self.m.b;
        let _ = self.m.s;
        let _ = self.m.a;
        let _ = self.m.c;
        let _ = self.m.sl;
        let _ = self.m.bu;
    }
}