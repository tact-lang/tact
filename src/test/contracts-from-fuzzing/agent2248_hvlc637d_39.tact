struct Middle {
    note: String;
}

struct Top {
    mid: Middle?;
}

contract NullMid {
    top: Top;

    init() {
        self.top = Top{ mid: null };
    }
}