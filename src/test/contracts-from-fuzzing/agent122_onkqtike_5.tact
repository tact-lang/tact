struct BigOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract BigOptionalContract {
    data: BigOptional;

    init() {
        self.data = BigOptional{
            a: null,
            b: true,
            c: null,
            d: 42,
            e: null,
            f: "", 
            g: null,
            h: false,
            i: "hi"
        };
    }
}
