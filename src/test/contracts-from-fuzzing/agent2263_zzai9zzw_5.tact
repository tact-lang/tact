struct Deep {
    v: Int;
}

struct Mid {
    d: Deep?;
}

struct Top {
    m: Mid?;
}

contract Test {
    data: Top;

    init() {
        self.data = Top{
            m: null
        };
    }
}