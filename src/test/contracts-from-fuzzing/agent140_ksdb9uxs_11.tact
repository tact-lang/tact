struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NullablePrimitives {
    optPrims: MultiOptional;

    init() {
        self.optPrims = MultiOptional{ a: null, b: null, c: null };
    }
}