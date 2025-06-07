struct Inner {
    f1: Int;
    f2: Int?;
}

struct Mid {
    inner: Inner;
    value: Bool?;
}

struct Outer {
    mid: Mid;
    s: String;
}

contract MultiNestedOptional {
    content: Outer;

    init() {
        self.content = Outer {
            mid: Mid {
                inner: Inner {
                    f1: 7,
                    f2: null
                },
                value: null
            },
            s: "hi"
        };
    }
}