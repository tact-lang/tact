struct Mid1 {
    f: Int;
}

struct Mid2 {
    g: Int;
}

struct Top {
    m1: Mid1;
    m2: Mid2;
    note: String;
}

contract WideNested {
    t: Top;

    init() {
        self.t = Top{
            m1: Mid1{f:1},
            m2: Mid2{g:2},
            note: "hey"
        };
    }
}