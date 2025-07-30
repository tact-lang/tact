struct Deep1 {
    x: Int;
    y: Bool;
    s: String?;
}

struct Deep2 {
    d1: Deep1;
    optD1: Deep1?;
}

struct Deep3 {
    d2: Deep2;
    optD2: Deep2?;
}

contract Test {
    field: Deep3;

    init() {
        self.field = Deep3{
            d2: Deep2{
                d1: Deep1{ x:1, y:true, s:"ok" },
                optD1: null
            },
            optD2: null
        };
    }
}