struct Opt1 {
    a: Int?;
    b: Bool?;
}

struct Opt2 {
    c: Int?;
    d: Bool?;
}

struct Opt3 {
    e: Int?;
    f: Bool?;
}

contract OptionalGroups {
    g1: Opt1;
    g2: Opt2;
    g3: Opt3;

    init() {
        self.g1 = Opt1{ a: null, b: null };
        self.g2 = Opt2{ c: null, d: null };
        self.g3 = Opt3{ e: null, f: null };
    }
}