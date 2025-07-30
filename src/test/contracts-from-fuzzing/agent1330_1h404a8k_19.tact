struct Inner {
    score: Int?;
}

struct Outer {
    num: Int?;
    txt: String?;
    nested: Inner;
    optNested: Inner?;
}

contract Mix {
    data: Outer;

    init() {
        self.data = Outer {
            num: 99,
            txt: "hello",
            nested: Inner { score: 7 },
            optNested: Inner { score: null },
        };
    }

    receive() {}
}
