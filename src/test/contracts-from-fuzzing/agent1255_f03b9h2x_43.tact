struct Bottom {
    x: Int;
    rest: Slice as remaining;
}

struct Mid {
    y: Int;
    payload: Bottom;
}

struct Top {
    header: Int;
    inner: Mid;
}

contract Test43 {
    data: Top;

    init() {
        self.data = Top{
            header: 1,
            inner: Mid{
                y: 2,
                payload: Bottom{
                    x: 3,
                    rest: emptyCell().asSlice(),
                },
            },
        };
    }
}