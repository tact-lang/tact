// Big struct combining nested structs and optionals
struct Sub {
    f1: Int;
    f2: String?;
}

struct Mid {
    a: Bool;
    sub: Sub?;
    b: Int;
}

contract ComboDeep {
    main: Mid;
    init() {
        self.main = Mid {
            a: true,
            sub: Sub { f1: 2, f2: null },
            b: 5
        };
    }
    receive() {
        if (self.main.sub != null) {
            self.main.b += self.main.sub!!.f1;
        }
    }
}