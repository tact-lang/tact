struct Bottom {
    tail: Slice as remaining;
}

struct Middle {
    inner: Bottom;
}

struct Top {
    mid: Middle;
}

contract Test23 {
    data: Top;

    init() {
        self.data = Top{
            mid: Middle{
                inner: Bottom{
                    tail: emptyCell().asSlice(),
                },
            },
        };
    }
}