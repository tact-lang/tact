struct Deep {
    val: Int?;
    flag: Bool?;
}

struct Mid {
    inner: Deep;
}

struct Top {
    mid: Mid;
}

contract TestContract {
    top: Top;

    init() {
        self.top = Top{
            mid: Mid{
                inner: Deep{
                    val: null,
                    flag: true,
                },
            },
        };
    }
}