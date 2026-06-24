struct MultiOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract TestContract {
    value: MultiOptionals;

    init() {
        self.value = MultiOptionals{
            a: 10,
            b: true,
            c: null,
            d: null,
            e: null
        };
    }
}