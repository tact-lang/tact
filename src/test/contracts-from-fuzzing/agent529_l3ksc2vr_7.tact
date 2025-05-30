struct Mid {
    m: Int;
    optM: Int?;
}

struct Top {
    a: Int;
    mid: Mid;
    optMid: Mid?;
}

contract CombineOptionalNested {
    top: Top;

    init() {
        self.top = Top{
            a: 10,
            mid: Mid{m: 1, optM: null},
            optMid: null
        };
    }
}