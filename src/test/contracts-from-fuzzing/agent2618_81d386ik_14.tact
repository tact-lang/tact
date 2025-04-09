struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract AllOptionals {
    o: MultiOpt;

    init() {
        self.o = MultiOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}