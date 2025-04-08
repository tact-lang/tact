struct MixedOptionals {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: String?;
}

contract MixedOptionalsTest {
    storage: MixedOptionals;

    init() {
        self.storage = MixedOptionals{
            a: 5,
            b: null,
            c: "hello",
            d: null,
            e: null,
        };
    }
}
