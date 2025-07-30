struct BigOptional {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
    s: String?; t: String?; u: String?;
}

contract LotsOptional {
    val: BigOptional;

    init() {
        self.val = BigOptional{
            a: null, b: null, c: null, d: null, e: null,
            f: null, g: null, h: null, i: null, j: null,
            s: null, t: null, u: null
        };
    }
}
