struct Deep1 {
    a: Int;
    b: String?;
}

struct Deep2 {
    d1: Deep1;
    c: Bool?;
}

struct Deep3 {
    d2: Deep2;
    e: Int?;
}

contract VeryDeepNesting {
    s: Deep3;
    init() {
        self.s = Deep3{
            d2: Deep2{
                d1: Deep1{
                    a: 7,
                    b: null
                },
                c: true
            },
            e: null
        };
    }
}