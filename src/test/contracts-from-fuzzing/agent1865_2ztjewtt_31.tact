struct HasMany {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract BigWrap {
    g: HasMany;

    init() {
        self.g = HasMany{
            a: 1,
            b: false,
            c: "",
            d: null,
            e: null,
            f: null,
        };
    }
}