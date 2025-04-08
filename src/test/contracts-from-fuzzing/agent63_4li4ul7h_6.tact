struct TinyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalDefaults {
    data: TinyOptional;

    init() {
        self.data = TinyOptional {
            a: null,
            b: null,
            c: null
        };
    }
}
