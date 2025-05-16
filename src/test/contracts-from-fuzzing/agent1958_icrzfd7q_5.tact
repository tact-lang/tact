struct Deeply {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
    e: Int;
}

contract ManyOptionals {
    field: Deeply;

    init() {
        self.field = Deeply{
            a: 1,
            b: null,
            c: 2,
            d: null,
            e: 3
        };
    }
}
