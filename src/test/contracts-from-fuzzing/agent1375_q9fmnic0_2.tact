struct Deep {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    count: Int as uint8;
}

contract DeeplyNested {
    field: Deep;

    init() {
        self.field = Deep{ inner: Inner{ flag: true, count: 7 } };
    }
}