struct StrA {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
}

contract DiverseStorage {
    sA: StrA;

    init() {
        self.sA = StrA{
            a: 5,
            b: false,
            c: "hello",
            d: null,
            e: true
        };
    }
}