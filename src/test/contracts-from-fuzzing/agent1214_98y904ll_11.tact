struct One {
    a: Int;
}

struct Two {
    b: Bool;
}

struct Three {
    c: String;
}

struct Four {
    d: Int?;
}

contract Test11 {
    s1: One;
    s2: Two;
    s3: Three;
    s4: Four;
    init() {
        self.s1 = One{ a: 1 };
        self.s2 = Two{ b: false };
        self.s3 = Three{ c: "hi" };
        self.s4 = Four{ d: null };
    }
}