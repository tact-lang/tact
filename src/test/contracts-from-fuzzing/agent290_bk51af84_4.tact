struct Deep {
    x: Int;
    y: Int?;
}

struct Mid {
    d: Deep;
    note: String?;
}

struct Top {
    m: Mid;
    count: Int;
}

contract Test {
    top: Top;

    init() {
        self.top = Top{
            m: Mid{
                d: Deep{ x: 10, y: null },
                note: null
            },
            count: 5
        };
    }
}