struct Mid {
    a: Int;
    b: String;
}

struct Top {
    mid: Mid;
    flag: Bool;
}

contract AnotherNested {
    x: Top;
    init() {
        self.x = Top {
            mid: Mid {
                a: 1,
                b: "abc"
            },
            flag: true
        };
    }
}