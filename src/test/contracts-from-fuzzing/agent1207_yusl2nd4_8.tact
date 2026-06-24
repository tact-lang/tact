struct HasManyOptional {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
}

contract ManyOptionals {
    f: HasManyOptional;

    init() {
        self.f = HasManyOptional{
            a: 1,
            b: null,
            c: null,
            d: null,
        };
    }
}