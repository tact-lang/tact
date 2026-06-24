struct MixedOptionals {
    a: Int?;
    b: Int;
    c: String?;
    d: String;
    e: Bool?
}

contract MixedOptionalsContract {
    val: MixedOptionals;

    init() {
        self.val = MixedOptionals{
            a: null,
            b: 1,
            c: null,
            d: "x",
            e: null
        };
    }
}
