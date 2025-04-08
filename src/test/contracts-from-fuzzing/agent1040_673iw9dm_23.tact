struct Large {
    a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?;
    g: Int as uint32; h: Int as int64; i: String; j: Bool;
    k: String?; l: Int; m: Bool?; n: Int?; o: String;
    p: Bool; q: Int as uint8; r: String?; s: Int as uint16; t: Bool;
}

contract TestContract {
    big: Large;

    init() {
        self.big = Large{
            a: 1, b: true, c: "one", d: null, e: false, f: "f",
            g: 2, h: 3, i: "i", j: false,
            k: null, l: 4, m: true, n: null, o: "o",
            p: true, q: 5, r: null, s: 6, t: false
        };
    }
}