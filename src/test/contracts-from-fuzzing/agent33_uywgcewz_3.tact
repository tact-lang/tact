struct OptionalNesting {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
    e: Cell?;
}

contract TestContract {
    data: OptionalNesting;

    init() {
        self.data = OptionalNesting{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
        };
    }
}