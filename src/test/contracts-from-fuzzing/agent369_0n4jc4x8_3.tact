struct MixedOptionals {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: String?;
}

contract MixedOptionalsTest {
    data: MixedOptionals;

    init() {
        self.data = MixedOptionals{
            a: 5,
            b: null,
            c: "ok",
            d: null,
            e: null,
        };
    }
}