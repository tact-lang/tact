struct MultiOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract ManyNullables {
    data: MultiOptionals;

    init() {
        self.data = MultiOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}