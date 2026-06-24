struct Mid {
    a: Int;
    b: Bool?;
    c: String;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract Test {
    t: Top;

    init() {
        self.t = Top{
            m1: Mid{ a:1, b:true, c:"x" },
            m2: Mid{ a:2, b:null, c:"y" },
        };
    }
}