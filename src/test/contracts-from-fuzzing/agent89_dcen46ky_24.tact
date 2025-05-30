struct Final {
    f: Int?;
}

struct Mid {
    x: Int;
    y: Final?;
}

struct Top {
    a: Bool;
    mid: Mid;
}

contract Fuzz24 {
    big: Top;

    init() {
        self.big = Top{
            a: true,
            mid: Mid{ x: 123, y: null },
        };
    }
}