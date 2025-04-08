struct Middle {
    a: Int;
    b: Bool;
    c: String;
}

struct Top {
    m1: Middle;
    m2: Middle;
    s: String;
}

contract MultiEmbedStructs {
    t: Top;
    init() {
        self.t = Top{
            m1: Middle{ a:1, b:true, c:"c1" },
            m2: Middle{ a:2, b:false, c:"c2" },
            s: "top",
        };
    }
}