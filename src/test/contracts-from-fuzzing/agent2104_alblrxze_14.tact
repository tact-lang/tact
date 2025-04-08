struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: String?;
    d: Address?;
    e: Bool?;
}

contract MassOptional {
    m: ManyOptionals;

    init() {
        self.m = ManyOptionals{
            a: null,
            b: 123,
            c: "hi",
            d: null,
            e: true
        };
    }
}