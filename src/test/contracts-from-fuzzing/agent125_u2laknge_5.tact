struct Deep1 {
    f: Int;
}

struct Deep2 {
    s: Deep1;
}

struct Deep3 {
    s: Deep2;
}

contract DeepNested {
    d: Deep3;

    init() {
        self.d = Deep3{
            s: Deep2{
                s: Deep1{
                    f: 777,
                },
            },
        };
    }
}