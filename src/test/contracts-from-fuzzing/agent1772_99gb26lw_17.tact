struct BigOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Test17 {
    bo: BigOptional;

    init() {
        self.bo = BigOptional{
            a: null,
            b: true,
            c: null,
            d: 100,
            e: null,
            f: "yo"
        };
    }
}