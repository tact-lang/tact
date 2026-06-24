struct DefaultOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract DefaultNulls {
    data: DefaultOptional;

    init() {
        self.data = DefaultOptional{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}
