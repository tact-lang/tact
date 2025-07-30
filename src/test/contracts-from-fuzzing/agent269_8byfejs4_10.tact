struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionalFields {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}