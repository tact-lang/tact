struct DeepOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract OptionalChain {
    deep: DeepOptional;

    init() {
        self.deep = DeepOptional{
            a: null,
            b: null,
            c: null,
            d: 5,
            e: null
        };
    }
}