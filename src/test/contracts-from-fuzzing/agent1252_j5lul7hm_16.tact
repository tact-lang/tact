struct BoolOptional {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
}

contract BoolOptContract {
    data: BoolOptional;

    init() {
        self.data = BoolOptional{
            a: true,
            b: null,
            c: false,
            d: null
        };
    }
}
