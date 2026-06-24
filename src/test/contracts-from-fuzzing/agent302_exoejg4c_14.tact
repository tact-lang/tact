struct AllOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Slice?;
    f: Cell?;
}

contract OptFloodTest {
    s: AllOptional;

    init() {
        self.s = AllOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}