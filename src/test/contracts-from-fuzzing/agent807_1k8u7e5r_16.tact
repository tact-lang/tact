struct Params {
    a: Int;
    b: Bool?;
    c: String?;
    d: Int;
}

contract PartialDefaults {
    field: Params;
    init() {
        self.field = Params{
            a: 1,
            b: null,
            c: null,
            d: 2
        };
    }
}