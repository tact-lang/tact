struct LargeNested {
    a: Int;
    b: Sub1;
}

struct Sub1 {
    c: Int;
    d: Sub2;
}

struct Sub2 {
    e: Int;
    f: Sub3;
}

struct Sub3 {
    g: Int;
}

contract Test36 {
    s: LargeNested;

    init() {
        self.s = LargeNested{
            a: 1,
            b: Sub1{
                c: 2,
                d: Sub2{
                    e: 3,
                    f: Sub3{ g: 4 }
                }
            }
        };
    }
}