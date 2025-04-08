struct Low {
    x: Int as uint8;
    y: Int?;
    z: Bool;
}

struct High {
    inner: Low;
    flag: Bool?;
    big: Int as int128;
}

contract NestedOptionsAndSizes {
    composite: High = High{
        inner: Low{
            x: 12,
            y: null,
            z: true,
        },
        flag: false,
        big: -123456789012345,
    };

    init() {
        self.composite = High{
            inner: Low{
                x: 255,
                y: 999,
                z: false,
            },
            flag: null,
            big: 1234567890,
        };
    }
}