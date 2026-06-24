struct Mid {
    left: Int;
    right: Int;
}

struct Out {
    inner: Mid;
    optInner: Mid?;
}

contract X {
    top: Out;

    init() {
        self.top = Out{
            inner: Mid{ left: 1, right:2 },
            optInner: null
        };
    }
}