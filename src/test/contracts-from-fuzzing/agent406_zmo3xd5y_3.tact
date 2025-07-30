struct Deep3 {
    u: Int;
}

struct Deep2 {
    t: Deep3;
    s: String;
}

struct Deep1 {
    x: Int;
    y: Bool;
    z: Deep2;
}

contract DeepNest {
    ss: Deep1;
    init() {
        self.ss = Deep1{
            x: 7,
            y: true,
            z: Deep2{
                t: Deep3{
                    u: 999
                },
                s: "deep"
            }
        };
    }
}