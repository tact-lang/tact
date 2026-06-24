struct TwoOpts {
    i: Int?;
    s: String?;
}

contract OptionalStructs {
    a: TwoOpts;
    b: TwoOpts;

    init() {
        self.a = TwoOpts{ i: null, s: "h" };
        self.b = TwoOpts{ i: 5, s: null };
    }
}