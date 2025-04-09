struct Variants {
    a: Int as uint8;
    b: Int as int64;
    c: Int?;
    d: String;
    e: Bool?;
}

contract ManyVariants {
    field: Variants;

    init() {
        self.field = Variants{
            a: 1,
            b: -64,
            c: null,
            d: "hello",
            e: true
        };
    }
}