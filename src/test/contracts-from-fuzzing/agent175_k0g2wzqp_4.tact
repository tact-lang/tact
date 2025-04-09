struct HasOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalsHolder {
    field: HasOptionals;

    init() {
        self.field = HasOptionals{
            a: null,
            b: true,
            c: "test",
            d: null,
        };
    }
}