struct AllOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    data: AllOptional;

    init() {
        self.data = AllOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}