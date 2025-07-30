struct AllOptionalDeep {
    a: Int?;
    b: String?;
    c: NestedOpt?;
}

struct NestedOpt {
    inner: String?;
    deeper: Int?;
}

contract OptionalMadness {
    flags: AllOptionalDeep;

    init() {
        self.flags = AllOptionalDeep{
            a: null,
            b: null,
            c: null
        };
    }
}