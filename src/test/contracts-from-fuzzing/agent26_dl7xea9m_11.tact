struct InnerMost {
    a: Int;
    b: Bool;
}

struct Mid {
    inner: InnerMost;
    txt: String;
}

struct OuterMost {
    m: Mid;
    flag: Bool;
}

contract Complex {
    c: OuterMost;

    init() {
        self.c = OuterMost{
            m: Mid{
                inner: InnerMost{a: 1, b: true},
                txt: "hello"
            },
            flag: false
        };
    }
}