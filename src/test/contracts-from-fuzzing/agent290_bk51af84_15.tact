struct Low {
    x: Int as uint8;
    y: Int? as uint16;
    z: Int as coins;
}

struct Mid {
    a: Int as int64;
    b: Int?;
    c: Low?;
}

struct Top {
    foo: Int;
    bar: Mid;
}

contract Test {
    data: Top;

    init() {
        self.data = Top{
            foo: 1,
            bar: Mid{
                a: 5,
                b: null,
                c: Low{ x: 3, y: 256, z: 10 }
            }
        };
    }
}