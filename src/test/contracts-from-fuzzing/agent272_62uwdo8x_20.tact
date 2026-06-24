struct Sub {
    v: Int? = null;
}

struct Massive {
    a: Int = 1;
    b: Bool? = null;
    c: Int = 2;
    d: Bool? = null;
    e: Sub = Sub{};
    f: Sub? = null;
    g: Int = 3;
    h: Int? = null;
    i: Bool = false;
    j: Bool? = null;
}

contract TestBigStruct {
    mass: Massive;

    init() {
        self.mass = Massive{
            a: 10,
            b: true,
            c: 20,
            d: false,
            e: Sub{ v: 50 },
            f: Sub{ v: 100 },
            g: 30,
            h: -1,
            i: true,
            j: false
        };
    }
}