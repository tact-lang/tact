struct S {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint256;
    d: Bool;
    e: String;
}

contract SerializationFormats {
    rec: S;

    init() {
        self.rec = S{
            a: 5,
            b: -5,
            c: 123456,
            d: true,
            e: "check"
        };
    }
}