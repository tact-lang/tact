struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalSpread {
    s: MultiOptional;

    init() {
        self.s = MultiOptional{
            a: null,
            b: null,
            c: null,
        };
    }
}