struct Base {
    a: Int;
}

struct Mid {
    b: Base;
    c: Int;
}

struct Top {
    d: Mid;
    e: String;
}

contract TestLongChain {
    val: Top;

    init() {
        self.val = Top{
            d: Mid{
                b: Base{ a:1 },
                c:2
            },
            e: "E"
        };
    }
}