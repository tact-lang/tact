contract TestContract {
    s1: Struct1;
    s2: Struct2;

    init() {
        self.s1 = Struct1{
            a: 1,
            b: 2,
            c: null
        };
        self.s2 = Struct2{
            s1_inner: Struct1{a: 5, b: 6, c: null},
            d: 7,
            e: false
        };
    }
}

struct Struct1 {
    a: Int;
    b: Int;
    c: Bool?;
}

struct Struct2 {
    s1_inner: Struct1;
    d: Int;
    e: Bool;
}
