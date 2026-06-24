struct Triple {
    a: Int;
    b: Bool?;
    c: Int?;
}

contract MultiTriples {
    t1: Triple;
    t2: Triple;
    t3: Triple;

    init() {
        self.t1 = Triple{ a: 9, b: null, c: null };
        self.t2 = Triple{ a: 8, b: false, c: null };
        self.t3 = Triple{ a: 7, b: true, c: 42 };
    }
}
