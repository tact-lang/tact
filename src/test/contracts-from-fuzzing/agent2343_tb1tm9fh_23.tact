struct Deep {
    a: Int;
    b: Int;
    c: Int;
}

struct Mid {
    d: Int;
    e: Deep;
}

struct TopLevel {
    f: Int;
    g: Mid;
}

contract DeepNest {
    content: TopLevel;

    init() {
        self.content = TopLevel{
            f: 1,
            g: Mid{
                d: 2,
                e: Deep{ a:3, b:4, c:5 }
            }
        };
    }
}
