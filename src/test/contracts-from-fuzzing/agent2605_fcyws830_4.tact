struct MixedOptional {
    a: Int?;
    b: Bool;
    c: String?;
    d: Cell;
    e: Bool?;
}

contract OptionalFields {
    payload: MixedOptional;

    init() {
        self.payload = MixedOptional{
            a: null,
            b: true,
            c: null,
            d: emptyCell(),
            e: false,
        };
    }
}
