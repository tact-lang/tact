struct DeepOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract OptionalStructStorage {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            a: null,
            b: 1,
            c: null,
            d: 2,
            e: null
        };
    }
}