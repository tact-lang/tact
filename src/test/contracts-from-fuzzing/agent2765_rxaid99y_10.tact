struct Sub {
    n: Int;
    s: String;
}

struct Middle {
    sub1: Sub;
    sub2: Sub;
}

struct Top {
    mid: Middle;
    flag: Bool;
}

contract DeepFields {
    t: Top;

    init() {
        self.t = Top{
            mid: Middle{
                sub1: Sub{n: 5, s: "five"},
                sub2: Sub{n: 6, s: "six"}
            },
            flag: true
        };
    }
}