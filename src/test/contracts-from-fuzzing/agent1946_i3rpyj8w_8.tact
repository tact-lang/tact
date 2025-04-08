struct Deep {
    foo: Int?;
    bar: Bool?;
}

struct Mid {
    deep: Deep;
    val: Int?;
}

struct Top {
    mid: Mid;
    flag: Bool?;
}

contract Test {
    top: Top;

    init() {
        self.top = Top{
            mid: Mid{
                deep: Deep{},
                val: null,
            },
            flag: null,
        };
    }
}
