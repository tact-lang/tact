struct DeepLow {
    a: Int as uint1;
    b: Int as int1;
}

struct MidLow {
    inner: DeepLow;
    c: Int as uint1;
}

struct TopLow {
    inner: MidLow;
}

contract MinBitWidths {
    data: TopLow;

    init() {
        self.data = TopLow{
            inner: MidLow{
                inner: DeepLow{
                    a: 1,
                    b: -1,
                },
                c: 1,
            },
        };
    }
}