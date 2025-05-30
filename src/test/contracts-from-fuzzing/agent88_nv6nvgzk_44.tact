struct AllOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract Test{
    o: AllOptionals;

    init() {
        self.o = AllOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}