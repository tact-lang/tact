struct Variety {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract StructWithMixes {
    v: Variety;

    init() {
        self.v = Variety{
            a: 1,
            b: false,
            c: "x",
            d: null,
            e: null,
            f: null
        };
    }

    receive() {
        self.v = Variety{
            a: 42,
            b: true,
            c: "y",
            d: 99,
            e: true,
            f: "zzz"
        };
    }
}