struct DeepMany {
    a: Int; b: Bool; c: String;
    d: Int?; e: Bool?; f: String?;
    g: Int; h: Bool; i: String;
    j: Int?; k: Bool?; l: String?;
    m: Int; n: Bool; o: String;
    p: Int?; q: Bool?; r: String?;
}

contract DeepManyTest {
    s: DeepMany;

    init() {
        self.s = DeepMany{
            a: 1, b: true, c: "c",
            d: null, e: false, f: null,
            g: 2, h: true, i: "i",
            j: null, k: true, l: "l",
            m: 99, n: false, o: "o",
            p: 100, q: true, r: "r",
        };
    }
}