struct OptionalMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool;
}

contract MixNulls {
    val: OptionalMix;
    init() {
        self.val = OptionalMix{
            a: null,
            b: null,
            c: null,
            d: 123,
            e: true
        };
    }
}