struct MixedOptionals {
    a: Int;
    b: String?;
    c: Bool;
    d: String;
    e: Int?;
    f: Bool?;
}

contract MixedOptionalsTest {
    val: MixedOptionals;

    init() {
        self.val = MixedOptionals{
            a: 1,
            b: null,
            c: false,
            d: "hello",
            e: null,
            f: null
        };
    }
}