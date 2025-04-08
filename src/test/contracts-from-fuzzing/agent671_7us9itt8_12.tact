struct SerOpts {
    a: Int as uint8;
    b: Int as int16;
    c: Bool;
    d: Int?;
    e: Int?;
}

contract TestContract {
    val: SerOpts;

    init() {
        self.val = SerOpts{
            a: 255,
            b: -123,
            c: true,
            d: null,
            e: 42
        };
    }
}