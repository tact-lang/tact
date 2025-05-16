struct AllOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptionalsStorage {
    data: AllOptional;

    init() {
        self.data = AllOptional{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}