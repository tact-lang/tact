struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract HasOptionals {
    field: DeepOptionals;
    init() {
        self.field = DeepOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
        };
    }
}