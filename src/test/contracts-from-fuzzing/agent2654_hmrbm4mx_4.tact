struct Deep {
    s: String;
    i: Int?;
}

struct Mid {
    inner: Deep;
    flag: Bool;
}

struct Outer {
    m: Mid;
    s: String;
}

contract DeeplyNested {
    o: Outer;

    init() {
        self.o = Outer {
            m: Mid {
                inner: Deep { s: "abc", i: null },
                flag: false
            },
            s: "xyz"
        };
    }
}