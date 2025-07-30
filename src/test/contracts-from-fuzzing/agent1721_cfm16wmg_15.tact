struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
}

contract MixTest {
    comb: Combo;

    init() {
        self.comb = Combo{
            a: 42,
            b: null,
            c: "test",
            d: 100,
            e: true,
        };
    }
}