struct Complex1 {
    s1: String;
    b1: Bool;
    i1: Int;
}

struct Complex2 {
    s2: String;
    i2: Int;
    c1: Complex1;
    b2: Bool?;
}

struct Complex3 {
    flag: Bool;
    optStr: String?;
    c2: Complex2;
}

contract Combo {
    data: Complex3 = Complex3{
        flag: true,
        optStr: "opt",
        c2: Complex2{
            s2: "s2",
            i2: 123,
            c1: Complex1{
                s1: "s1",
                b1: false,
                i1: -99
            },
            b2: null,
        }
    };

    init() {
        self.data = self.data;
    }

    receive() {
        self.data = self.data;
    }
}