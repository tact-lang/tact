struct Deepest {
    x: Int;
    y: Int;
    label: String;
}

struct Middle {
    flag: Bool;
    data: Deepest;
    count: Int;
}

struct Top {
    a: Int;
    mid: Middle;
    txt: String;
}

contract DeepNested {
    root: Top;

    init() {
        self.root = Top{
            a: 5,
            mid: Middle{
                flag: true,
                data: Deepest{x: 1, y: 2, label: "deep"},
                count: 42
            },
            txt: "top"
        };
    }
}
