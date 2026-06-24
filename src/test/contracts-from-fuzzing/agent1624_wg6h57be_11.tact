struct AllOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

contract NullStructAllOptional {
    optData: AllOptional;

    init() {
        self.optData = AllOptional{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}