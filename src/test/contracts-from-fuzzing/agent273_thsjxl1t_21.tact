struct Mid { a: Int; }

struct Top {
    mid1: Mid;
    mid2: Mid;
}

contract Test21 {
    d: Top;

    init() {
        self.d = Top{
            mid1: Mid{ a: 1 },
            mid2: Mid{ a: 2 }
        };
    }
}