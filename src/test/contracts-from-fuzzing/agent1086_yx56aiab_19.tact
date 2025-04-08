struct LargeOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract OptionalFieldsContract {
    state: LargeOptional;

    init() {
        self.state = LargeOptional{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: null
        };
    }
}