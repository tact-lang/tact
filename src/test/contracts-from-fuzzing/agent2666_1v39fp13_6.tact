struct OptDeep {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract OptionalStorage {
    data: OptDeep;

    init() {
        self.data = OptDeep{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}