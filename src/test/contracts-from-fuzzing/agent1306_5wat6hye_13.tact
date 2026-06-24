struct BigOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract NullFields {
    data: BigOptionals;
    init() {
        self.data = BigOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}