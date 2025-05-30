struct Base {
    x: Int as uint8;
    y: Int as int16;
}

struct Mid {
    a: Base;
    b: Int as coins;
}

struct Top {
    one: Mid;
    two: Base;
}

contract SerialNest {
    v: Top;

    init() {
        self.v = Top{
            one: Mid{
                a: Base{ x: 255, y: -100 },
                b: ton("2")
            },
            two: Base{ x: 10, y: 200 }
        };
    }
}