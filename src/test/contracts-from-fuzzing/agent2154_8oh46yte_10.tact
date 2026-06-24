struct Tiny {
    val: Int;
}

struct Mid {
    t: Tiny;
    v: Int;
}

struct Big {
    m1: Mid;
    m2: Mid;
    note: String;
    flag: Bool;
}

contract MultiNested {
    big: Big;

    init() {
        self.big = Big{
            m1: Mid{t:Tiny{val:1}, v:2},
            m2: Mid{t:Tiny{val:3}, v:4},
            note: "test",
            flag: true
        };
    }
}