struct DeeplyOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
}

contract OptionalStructField {
    s: DeeplyOptional?;

    init() {
        self.s = null;
    }
}