struct ManyOptional {
    a: Int?; b: Int?; c: Int?;
    d: Bool?; e: Bool?; f: Bool?;
    g: String?; h: String?; i: String?;
}

contract ManyOptionalContract {
    field: ManyOptional;

    init() {
        self.field = ManyOptional{
            a: null, b: 2, c: null,
            d: true, e: null, f: false,
            g: "x", h: null, i: "y"
        };
    }
}