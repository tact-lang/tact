struct AllOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract OptionStructContract {
    data: AllOptionals;

    init() {
        self.data = AllOptionals{
            i: null,
            b: null,
            s: null,
            a: null,
            c: null,
            sl: null,
        };
    }
}