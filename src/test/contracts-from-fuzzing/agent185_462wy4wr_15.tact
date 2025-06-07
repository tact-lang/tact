struct BigOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;
}

contract ManyOptionals {
    data: BigOptional;

    init() {
        self.data = BigOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}