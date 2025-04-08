struct IntsBoolsMix {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
}

contract MixedFields {
    data: IntsBoolsMix;
    init() {
        self.data = IntsBoolsMix{
            a: 1,
            b: true,
            c: 2,
            d: false,
            e: 3,
            f: true
        };
    }
}