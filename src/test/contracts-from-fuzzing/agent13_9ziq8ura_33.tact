struct Mid {
    x: Int?;
    y: Bool;
}

struct Top {
    m: Mid?;
}

contract NullableMid {
    data: Top;

    init() {
        self.data = Top{ m: null };
    }
}