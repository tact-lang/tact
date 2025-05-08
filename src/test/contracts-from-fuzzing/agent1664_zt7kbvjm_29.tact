struct InnerS {
    small: Int as uint8;
    mid: Int as uint32;
    large: Int as int64;
}

struct OuterS {
    inner: InnerS;
    flag: Bool;
}

contract SerializeHints {
    data: OuterS;

    init() {
        self.data = OuterS{
            inner: InnerS{
                small: 10,
                mid: 1000,
                large: -5000
            },
            flag: true
        };
    }
}