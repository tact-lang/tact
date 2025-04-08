struct Outermost {
    mid: Mid;
    text: String;
}

struct Mid {
    inner: Inner;
    optInner: Inner?;
}

struct Inner {
    val: Int;
    optStr: String?;
}

contract Test {
    state: Outermost;

    init() {
        self.state = Outermost{
            mid: Mid{
                inner: Inner{ val:1, optStr:null },
                optInner: null,
            },
            text: "final",
        };
    }
}