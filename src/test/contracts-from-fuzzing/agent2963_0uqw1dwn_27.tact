struct BigFieldOrder {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract BigOrderVariation {
    f: Bool?;
    e: String?;
    d: Int?;
    c: Bool;
    b: String;
    a: Int;
    nested: BigFieldOrder;

    init() {
        self.f = null;
        self.e = "hi";
        self.d = 42;
        self.c = true;
        self.b = "bye";
        self.a = 17;
        self.nested = BigFieldOrder{
            a: 1,
            b: "x",
            c: false,
            d: null,
            e: "z",
            f: true
        };
    }
}
