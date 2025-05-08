struct Cyprus {
    a: Bool;
    b: Int?;
    c: Int;
    d: Bool?;
    e: Bool;
    f: Int?;
}

contract OptionalBetween {
    val: Cyprus;

    init() {
        self.val = Cyprus{
            a: true,
            b: null,
            c: 42,
            d: true,
            e: false,
            f: null
        };
    }
}
