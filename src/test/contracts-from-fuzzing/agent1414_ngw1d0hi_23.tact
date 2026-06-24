struct DeeplyOpt {
    a: Int?; b: Bool?; c: String?;
    d: Int?; e: Bool?; f: String?;
    g: Int?; h: Bool?; i: String?;
}

contract DeepManyOpts {
    data: DeeplyOpt;

    init() {
        self.data = DeeplyOpt {
            a: null, b: null, c: null,
            d: null, e: null, f: null,
            g: null, h: null, i: null
        };
    }
}