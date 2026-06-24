struct Opts1 {
    i: Int?;
}

struct Opts2 {
    s: String?;
}

struct Combo {
    o1: Opts1?;
    o2: Opts2?;
    b: Bool;
}

contract OptionalLayered {
    val: Combo = Combo{
        o1: null,
        o2: null,
        b: true
    };

    init() {
        self.val = Combo{
            o1: Opts1{i: 10},
            o2: Opts2{s: "abc"},
            b: false
        };
    }
}