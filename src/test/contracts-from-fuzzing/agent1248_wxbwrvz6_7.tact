struct SmallInts {
    a: Int as uint8;
    b: Int as int64;
    c: Bool;
    d: String;
}

contract SerializedStructs {
    data: SmallInts;

    init() {
        self.data = SmallInts{
            a: 25,
            b: -12345678,
            c: true,
            d: "ok"
        };
    }
}
