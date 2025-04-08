struct Deep {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract DefaultOptMix {
    d: Deep = Deep{};

    init() {
        self.d = Deep{ a: null, b: "str", c: true };
    }
}