struct BigNest {
    lvl1: Int;
    lvl2: SubNest;
}

struct SubNest {
    a: Int;
    b: Bool;
    c: StrNest;
}

struct StrNest {
    s: String;
    t: Bool?;
}

contract HardcoreNest {
    big: BigNest;

    init() {
        self.big = BigNest{
            lvl1: 1,
            lvl2: SubNest{
                a: 2,
                b: false,
                c: StrNest{
                    s: "hello",
                    t: null
                }
            }
        };
    }
}