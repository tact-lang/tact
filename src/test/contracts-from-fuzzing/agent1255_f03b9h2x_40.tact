struct Deep {
    x: Int;
    payload: Slice as remaining;
}

struct Mid {
    inner: Deep?;
}

struct Top {
    mid: Mid?;
}

contract Test40 {
    data: Top;

    init() {
        self.data = Top{
            mid: null,
        };
    }
}