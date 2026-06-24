struct AllOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    all: AllOptional;

    init() {
        self.all = AllOptional{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}