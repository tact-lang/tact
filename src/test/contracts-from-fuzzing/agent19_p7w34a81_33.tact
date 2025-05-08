struct OptionalMany {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract LotsOfOptionals {
    data: OptionalMany;

    init() {
        self.data = OptionalMany{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}