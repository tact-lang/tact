struct Deep {
    a: Int;
    b: Bool;
}

struct Mid {
    x: Int;
    deep: Deep;
}

struct Top {
    mid: Mid;
    flag: Bool;
    msg: String;
}

contract DeepNested {
    top: Top;

    init() {
        self.top = Top{
            mid: Mid{
                x: 7,
                deep: Deep{ a: 1, b: false }
            },
            flag: true,
            msg: "Hello"
        };
    }
}
