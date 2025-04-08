struct Deep1 {
    k: Int;
}

struct Deep2 {
    prev: Deep1;
    j: Int;
}

struct Deep3 {
    before: Deep2;
    hidden: Deep1;
}

contract MultiDeep {
    a: Deep3;

    init() {
        self.a = Deep3{
            before: Deep2{
                prev: Deep1{ k:1 },
                j: 2
            },
            hidden: Deep1{ k:3 }
        };
    }
}