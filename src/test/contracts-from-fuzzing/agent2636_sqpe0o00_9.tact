struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
}

contract OptionalFields {
    many: ManyOptionals;

    init() {
        self.many = ManyOptionals{
            a: 1,
            b: null,
            c: null,
            d: 4,
            e: null,
            f: 6,
        };
    }
}