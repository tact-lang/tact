struct S1 {
    a: Int;
    b: Bool;
    c: Int?;
}

struct S2 {
    s1_1: S1;
    s1_2: S1;
    number: Int;
}

contract Storage {
    store: S2;

    init() {
        self.store = S2{
            s1_1: S1{a: 1, b: true, c: null},
            s1_2: S1{a: 2, b: false, c: null},
            number: 100,
        };
    }
}