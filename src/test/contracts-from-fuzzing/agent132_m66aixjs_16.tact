// Struct with many bools, optionals, strings intertwined
struct Mix {
    a: Bool;
    b: Bool?;
    c: String;
    d: String?;
    e: Int;
    f: Int?;
    g: Bool;
    h: Bool?;
}

contract Interlace {
    m: Mix;

    init() {
        self.m = Mix{
            a: true,
            b: null,
            c: "c",
            d: null,
            e: 123,
            f: null,
            g: false,
            h: true,
        };
    }
}