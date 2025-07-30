struct Combinations {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract Test {
    combos: Combinations;

    init() {
        self.combos = Combinations{
            a: 1,
            b: null,
            c: false,
            d: true,
            e: "string",
            f: null
        };
    }
}