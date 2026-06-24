struct MultiOptionals {
    a: Int?;
    b: String?;
    c: Address?;
    d: Cell?;
    e: Bool?;
}

contract TestMultiOptionals {
    data: MultiOptionals;

    init() {
        self.data = MultiOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}
