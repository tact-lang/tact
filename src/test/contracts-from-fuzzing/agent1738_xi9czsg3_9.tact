struct Middle {
    val: Int;
}

struct Top {
    inner: Middle;
    optInner: Middle?;
}

contract Test {
    storage: Top;

    init() {
        self.storage = Top{
            inner: Middle{ val: 42 },
            optInner: null
        };
    }
}
