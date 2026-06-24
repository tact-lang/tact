// deeply nested struct with serialization formats
struct Last {
    x: Int as uint4;
    y: Int as uint8;
}

struct Mid {
    l: Last;
}

struct Top {
    m: Mid;
}

contract SerialDeep {
    s: Top;
    init() {
        self.s = Top{ m: Mid{ l: Last{ x: 3, y: 200 }}};
    }
}