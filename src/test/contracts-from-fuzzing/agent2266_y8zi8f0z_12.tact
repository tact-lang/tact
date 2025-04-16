struct Bottom {
    s: String?;
    fl: Bool;
}

struct Mid {
    b1: Bottom;
    b2: Bottom;
    note: String;
}

contract Test {
    m: Mid;

    init() {
        self.m = Mid{
            b1: Bottom{s: null, fl: false},
            b2: Bottom{s: "x", fl: true},
            note: "hi",
        };
    }
}
