struct MixedOpts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract MultiOptFields {
    one: MixedOpts;
    two: MixedOpts;

    init() {
        self.one = MixedOpts{ a: null, b: true, c: null };
        self.two = MixedOpts{ a: 5, b: null, c: "hi" };
    }
}