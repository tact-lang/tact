struct SmallS {
    i: Int;
    s: String;
}

struct MidS {
    a: SmallS;
    b: Bool;
}

struct TopS {
    m: MidS;
    opt: Int?;
}

contract NestWithOpts {
    top: TopS;
    init() {
        self.top = TopS{
            m: MidS{ a: SmallS{ i: 1, s: "t" }, b: true },
            opt: null
        };
    }
}