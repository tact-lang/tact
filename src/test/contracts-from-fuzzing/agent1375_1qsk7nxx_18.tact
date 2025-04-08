struct Deep {
    a: String;
    b: Int;
    c: Bool;
}

struct Middle {
    x: Int;
    y: Deep;
}

struct Top {
    m: Middle;
    s: String;
}

contract DeepHierarchy {
    data: Top;

    init() {
        self.data = Top{
            m: Middle{
                x: 10,
                y: Deep{a: "hi", b: 20, c: false},
            },
            s: "done",
        };
    }
}