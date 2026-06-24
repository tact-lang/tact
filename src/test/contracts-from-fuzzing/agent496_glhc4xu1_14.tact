struct FineInner {
    big: Int as int64;
    small: Int as uint32;
}

struct FineOuter {
    inner: FineInner;
    marker: Bool;
}

contract SerializeHints {
    data: FineOuter;

    init() {
        self.data = FineOuter{
            inner: FineInner{
                big: -1000,
                small: 42
            },
            marker: true
        };
    }
}