struct SDeep {
    a: Int;
    b: String?;
    c: Bool;
    d: String;
    e: Int?;
    f: Bool?;
}

contract ManyTypes {
    x: SDeep;

    init() {
        self.x = SDeep{
            a: 1,
            b: null,
            c: true,
            d: "abc",
            e: null,
            f: null
        };
    }
}
