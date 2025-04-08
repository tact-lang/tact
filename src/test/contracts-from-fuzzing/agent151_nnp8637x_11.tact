struct Mix {
    a: Int as uint4;
    b: Int?;
    c: Bool;
    d: String?;
    e: Int as int16;
}

contract Test {
    m: Mix;

    init() {
        self.m = Mix{
            a: 7,
            b: null,
            c: true,
            d: "test",
            e: -128,
        };
    }
}