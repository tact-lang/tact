struct C1 {
    v: Int;
}
struct C2 {
    f: Bool?;
}

contract InitCertainFields {
    c1: C1;
    c2: C2;
    intopt: Int?;

    init() {
        self.c1 = C1{v: 111};
        self.c2 = C2{f: null};
        self.intopt = null;
    }
}
