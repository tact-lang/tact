struct HasManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: String?;
}

contract ManyNullableFields {
    val: HasManyOptionals;

    init() {
        self.val = HasManyOptionals{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: "test"
        };
    }
}
