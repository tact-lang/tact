struct InnerMost {
    x: Int;
    y: String;
}

struct Mid {
    m: InnerMost;
    optStr: String?;
}

struct Top {
    t: Mid;
    flag: Bool;
}

contract OptDeepNest {
    content: Top?;

    init() {
        self.content = Top{
            t: Mid{
                m: InnerMost{x:5,y:"inner"},
                optStr: null,
            },
            flag: true,
        };
    }
}