struct Mid {
    x: Int;
    y: Int?;
}

struct Top {
    a: Int;
    b: Mid;
    c: Mid;
    d: Int?;
}

contract Layers {
    st: Top;

    init() {
        self.st = Top{
            a: 5,
            b: Mid{x: 1, y: null},
            c: Mid{x: 2, y: 10},
            d: null
        };
    }
}