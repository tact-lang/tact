// Large struct with a variety of types and optionals
struct BigVariety {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int as uint8;
    h: Int as int16;
    i: Int as uint32;
}

contract TestContract {
    x: BigVariety;

    init() {
        self.x = BigVariety {
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "hi",
            f: null,
            g: 2,
            h: -1,
            i: 33,
        };
    }
}