struct HasManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
}

contract NestedManyOptionals {
    f: HasManyOptionals;

    init() {
        self.f = HasManyOptionals{
            a: null,
            b: 2,
            c: null,
            d: "hi",
        };
    }
}