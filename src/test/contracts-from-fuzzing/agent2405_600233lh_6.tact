struct InnerMost { val: Int; }

struct InnerMid {
    inner: InnerMost;
    flag: Bool;
}

struct Inner {
    mid: InnerMid;
    opt: String?;
}

contract ManyLevels {
    data: Inner;

    init() {
        self.data = Inner{
            mid: InnerMid{ inner: InnerMost{ val: 7 }, flag: true },
            opt: null
        };
    }
}