struct BoolOptional {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
}

contract OptionalAndNot {
    item: BoolOptional;

    init() {
        self.item = BoolOptional{
            a: true,
            b: null,
            c: false,
            d: null
        };
    }
}
