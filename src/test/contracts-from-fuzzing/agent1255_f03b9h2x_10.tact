struct Lower {
    x: Int;
}

struct Middle {
    inner: Lower?;
}

struct Top {
    mid: Middle?;
}

contract Test10 {
    data: Top;

    init() {
        self.data = Top{
            mid: null,
        };
    }
}