struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract TestContract {
    testField: ManyOptionals;

    init() {
        self.testField = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}
