struct OptionalNested {
    s: String?;
    c: Cell?;
    b: Bool?;
    sl: Slice?;
    a: Address?;
}

contract TestContract {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{
            s: null,
            c: null,
            b: null,
            sl: null,
            a: null,
        };
    }
}