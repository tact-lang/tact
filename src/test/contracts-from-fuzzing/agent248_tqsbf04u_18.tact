struct Combo {
    a: Int as uint8;
    b: Int as int64;
    c: Int?;
    d: Int as uint251;
    e: Int?;
    f: Bool?;
    g: Bool;
    h: String;
}

contract ComboStorage {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 12,
            b: -456789,
            c: null,
            d: 9876543210,
            e: 4321,
            f: true,
            g: false,
            h: "xyz"
        };
    }
}