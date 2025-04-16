struct Big {
    a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?;
    g: Int; h: Bool; i: String; j: Int?; k: Bool?; l: String?;
}

contract BigFields {
    data: Big;

    init() {
        self.data = Big{
            a: 1, b: true, c: "C", d: null, e: false, f: null,
            g: 2, h: false, i: "I", j: null, k: true, l: "L",
        };
    }
}
