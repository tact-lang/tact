struct Deep3 {
    v: Int;
}

struct Deep2 {
    s: Deep3;
}

struct Deep1 {
    s: Deep2;
}

contract DeepNested {
    rec: Deep1;

    init() {
        self.rec = Deep1{
            s: Deep2{
                s: Deep3{
                    v: 7,
                },
            },
        };
    }
}